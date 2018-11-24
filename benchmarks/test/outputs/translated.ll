; ModuleID = './outputs/translated.bc'
source_filename = "testd.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [21 x i8] c" [target finished!]\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c" [target] Execution Time: %ld\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define void @t1() #0 {
  call void @enqueue_signature(i32 17)
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 1, i32* %2, align 4
  store i32 2, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %14, %0
  call void @enqueue_signature(i32 5)
  %6 = load i32, i32* %4, align 4
  %7 = icmp slt i32 %6, 11
  br i1 %7, label %8, label %17

; <label>:8:                                      ; preds = %5
  call void @enqueue_signature(i32 19)
  %9 = load i32, i32* %1, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %1, align 4
  %11 = load i32, i32* %1, align 4
  %12 = load i32, i32* %2, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, i32* %1, align 4
  br label %14

; <label>:14:                                     ; preds = %8
  call void @enqueue_signature(i32 9)
  %15 = load i32, i32* %4, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %4, align 4
  br label %5

; <label>:17:                                     ; preds = %5
  call void @enqueue_signature_with_return(i32 1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  call void @init_monitor()
  call void @enqueue_signature(i32 11)
  %1 = alloca i32, align 4
  %2 = alloca %struct.timeval, align 8
  %3 = alloca %struct.timeval, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %8 = call i32 @gettimeofday(%struct.timeval* %2, %struct.timezone* null) #3
  br label %9

; <label>:9:                                      ; preds = %0
  call void @enqueue_signature(i32 13)
  store i32 0, i32* %4, align 4
  store i32 1, i32* %5, align 4
  store i32 2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %10

; <label>:10:                                     ; preds = %32, %9
  call void @enqueue_signature(i32 5)
  %11 = load i32, i32* %7, align 4
  %12 = icmp slt i32 %11, 5000
  br i1 %12, label %13, label %35

; <label>:13:                                     ; preds = %10
  call void @enqueue_signature_with_call(i32 30)
  %14 = load i32, i32* %4, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %4, align 4
  %16 = load i32, i32* %5, align 4
  %17 = load i32, i32* %4, align 4
  %18 = sdiv i32 %16, %17
  store i32 %18, i32* %5, align 4
  %19 = load i32, i32* %4, align 4
  %20 = load i32, i32* %6, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, i32* %6, align 4
  call void @t1()
  br label %22

; <label>:22:                                     ; preds = %13
  call void @enqueue_signature(i32 32)
  %23 = load i32, i32* %4, align 4
  %24 = load i32, i32* %5, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, i32* %4, align 4
  %26 = load i32, i32* %5, align 4
  %27 = load i32, i32* %6, align 4
  %28 = mul nsw i32 %26, %27
  store i32 %28, i32* %5, align 4
  %29 = load i32, i32* %4, align 4
  %30 = load i32, i32* %4, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, i32* %6, align 4
  br label %32

; <label>:32:                                     ; preds = %22
  call void @enqueue_signature(i32 9)
  %33 = load i32, i32* %7, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %7, align 4
  br label %10

; <label>:35:                                     ; preds = %10
  call void @enqueue_signature(i32 1)
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0))
  br label %37

; <label>:37:                                     ; preds = %35
  call void @enqueue_signature(i32 1)
  %38 = call i32 @gettimeofday(%struct.timeval* %3, %struct.timezone* null) #3
  br label %39

; <label>:39:                                     ; preds = %37
  call void @enqueue_signature(i32 16)
  %40 = getelementptr inbounds %struct.timeval, %struct.timeval* %3, i32 0, i32 0
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %struct.timeval, %struct.timeval* %2, i32 0, i32 0
  %43 = load i64, i64* %42, align 8
  %44 = sub nsw i64 %41, %43
  %45 = mul nsw i64 %44, 1000000
  %46 = getelementptr inbounds %struct.timeval, %struct.timeval* %3, i32 0, i32 1
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds %struct.timeval, %struct.timeval* %2, i32 0, i32 1
  %49 = load i64, i64* %48, align 8
  %50 = sub nsw i64 %47, %49
  %51 = add nsw i64 %45, %50
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i32 0, i32 0), i64 %51)
  br label %53

; <label>:53:                                     ; preds = %39
  call void @enqueue_signature_with_remainder_process(i32 3)
  %54 = load i32, i32* %1, align 4
  ret i32 %54
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

declare i32 @printf(i8*, ...) #2

declare void @init_monitor()

declare void @enqueue_signature(i32)

declare void @enqueue_signature_with_call(i32)

declare void @enqueue_signature_with_return(i32)

declare void @enqueue_signature_with_remainder_process(i32)

define void @CallcheckerSet() {
entry:
  call void @init_monitor()
  call void @enqueue_signature(i32 1)
  call void @enqueue_signature_with_call(i32 1)
  call void @enqueue_signature_with_return(i32 1)
  call void @enqueue_signature_with_remainder_process(i32 1)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
