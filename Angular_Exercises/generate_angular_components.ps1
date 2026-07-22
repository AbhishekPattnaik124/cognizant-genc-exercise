cd d:\cognizant\Angular_Exercises\student-course-portal

# Components
ng generate component components/header --skip-tests
ng generate component pages/home --skip-tests
ng generate component pages/course-list --skip-tests
ng generate component pages/student-profile --skip-tests
ng generate component components/course-card --skip-tests
ng generate component pages/course-detail --skip-tests
ng generate component pages/enrollment-form --skip-tests
ng generate component pages/reactive-enrollment-form --skip-tests

# Directives & Pipes
ng generate directive directives/highlight --skip-tests
ng generate pipe pipes/credit-label --skip-tests

# Services
ng generate service services/course --skip-tests
ng generate service services/enrollment --skip-tests

# Modules (Lazy Loading)
ng generate module features/enrollment --routing

# Guards & Interceptors
# Note: ng generate guard / interceptor in modern Angular generates functional guards/interceptors by default.
ng generate guard guards/auth --functional=false --skip-tests
ng generate guard guards/unsaved-changes --functional=false --skip-tests
ng generate interceptor interceptors/auth --functional=false --skip-tests
ng generate interceptor interceptors/error-handler --functional=false --skip-tests

echo "Generation complete"
