# Error Handler Mixin - دليل الاستخدام

## 📋 نظرة عامة

نظام موحد لمعالجة الأخطاء في جميع الـ Cubits/Blocs يوفر:
- ✅ معالجة موحدة للأخطاء
- ✅ عرض Toast تلقائي للأخطاء
- ✅ Logging للأخطاء
- ✅ سهولة الاستخدام والصيانة

---

## 🚀 كيفية الاستخدام

### 1️⃣ إضافة ErrorListener في جذر التطبيق

في `app.dart` أو `main.dart`:

```dart
import 'package:bond/core/bloc/widget/error_listener.dart';

@override
Widget build(BuildContext context) {
  return ErrorListener(
    child: MaterialApp(
      // ... app configuration
    ),
  );
}
```

### 2️⃣ استخدام ErrorHandlerMixin في الـ Cubit

#### مثال: AppCubit

```dart
import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/mixin/error_handler_mixin.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppCubit extends Cubit<AppState> with ErrorHandlerMixin<AppState> {
  final AppRepositoryImpl appRepositoryImpl;

  AppCubit(this.appRepositoryImpl) : super(const AppState()) {
    getGovernorates();
  }

  Future<void> getGovernorates() async {
    // بدء التحميل
    emit(state.copyWith(isLoadingGovernorates: true, errorMessage: null));
    
    // جلب البيانات من الـ repository
    final result = await appRepositoryImpl.getGovernorates();
    
    // معالجة النتيجة باستخدام الـ mixin
    await handleResult(
      result: result,
      onSuccess: (governorates) => state.copyWith(
        governorates: governorates,
        isLoadingGovernorates: false,
        errorMessage: null,
      ),
      onError: (error) => state.copyWith(
        isLoadingGovernorates: false,
        errorMessage: error,
      ),
      showError: true, // 👈 عرض الخطأ في toast تلقائياً
    );
  }
}
```

---

## 📦 المكونات الأساسية

### 1. ErrorHandlerMixin

**الموقع:** `lib/core/bloc/mixin/error_handler_mixin.dart`

Mixin يضاف لأي Cubit لمعالجة الأخطاء بطريقة موحدة.

**المعاملات:**
- `result`: النتيجة من الـ repository (Either<Failure, R>)
- `onSuccess`: callback عند النجاح - يرجع الـ state الجديد
- `onError`: callback عند الفشل (optional) - يرجع الـ state الجديد
- `showError`: إذا كان true، سيتم عرض الخطأ في toast (default: false)

### 2. ErrorEmitter

**الموقع:** `lib/core/bloc/helper/error_emitter.dart`

Singleton يبث الأخطاء من الـ Cubits إلى الـ UI باستخدام Stream.

### 3. ErrorListener

**الموقع:** `lib/core/bloc/widget/error_listener.dart`

Widget يستمع للأخطاء ويعرضها في Toast تلقائياً.

---

## 🎨 بنية الـ State المطلوبة

للاستفادة الكاملة من الـ mixin، يجب أن يحتوي الـ state على:

```dart
@freezed
sealed class YourState with _$YourState {
  const YourState._();

  const factory YourState({
    // ... your data fields
    String? errorMessage,  // 👈 مهم لحفظ رسالة الخطأ
  }) = _YourState;
}
```

---

## 🔥 أمثلة إضافية

### مثال 1: بدون عرض Toast

```dart
await handleResult(
  result: result,
  onSuccess: (data) => state.copyWith(data: data),
  showError: false, // لن يظهر toast
);
```

### مثال 2: معالجة خاصة للأخطاء

```dart
await handleResult(
  result: result,
  onSuccess: (data) => state.copyWith(
    data: data,
    isLoading: false,
  ),
  onError: (error) {
    // معالجة خاصة للخطأ
    return state.copyWith(
      isLoading: false,
      errorMessage: 'حدث خطأ: $error',
    );
  },
  showError: true,
);
```

### مثال 3: استخدام في bloc بدلاً من cubit

```dart
class UserBloc extends Bloc<UserEvent, UserState> with ErrorHandlerMixin<UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUserEvent>(_onLoadUser);
  }

  Future<void> _onLoadUser(
    LoadUserEvent event,
    Emitter<UserState> emitter,
  ) async {
    emitter(LoadingState());
    
    final result = await userRepository.getUser(event.userId);
    
    // استخدام الـ mixin
    await handleResult(
      result: result,
      onSuccess: (user) => UserLoadedState(user: user),
      onError: (error) => UserErrorState(error: error),
      showError: true,
    );
  }
}
```

---

## 🛠️ تخصيص عرض الأخطاء

يمكنك تعديل طريقة عرض الأخطاء في `error_listener.dart`:

```dart
void _listenToErrors() {
  _errorSubscription = _errorEmitter.errorStream.listen((error) {
    if (mounted && error.isNotEmpty) {
      // استخدم أي طريقة لعرض الأخطاء
      AppConstant.showToast(
        msg: error,
        color: Colors.red,
      );
      
      // أو استخدم SnackBar
      // AppConstant.showCustomSnakeBar(context, error, false);
      
      // أو استخدم Dialog
      // showDialog(...);
    }
  });
}
```

---

## 📝 ملاحظات مهمة

1. **استخدم `showError: true` فقط للأخطاء المهمة**: لا تعرض toast لكل خطأ صغير
2. **احفظ الـ errorMessage في الـ state**: مفيد للـ debugging والـ testing
3. **استخدم الـ mixin في جميع الـ Cubits**: للحفاظ على consistency
4. **أضف ErrorListener مرة واحدة**: في جذر التطبيق فقط

---

## 🎯 الفوائد

✅ **كود أقل**: لا حاجة لكتابة `fold` في كل مرة  
✅ **Consistency**: طريقة موحدة لمعالجة الأخطاء  
✅ **سهولة الصيانة**: تعديل واحد يؤثر على كل التطبيق  
✅ **UX أفضل**: عرض تلقائي للأخطاء للمستخدم  
✅ **Debugging أسهل**: logging موحد للأخطاء  
✅ **Testing أسهل**: يمكن mock الـ mixin بسهولة  

---

## 🔮 تحسينات مستقبلية

- إضافة Firebase Crashlytics في `_logError`
- إضافة Sentry لتتبع الأخطاء
- إضافة retry mechanism
- إضافة offline handling
- إضافة error codes للأخطاء المختلفة

