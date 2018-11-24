; ModuleID = './outputs/translated.bc'
source_filename = "qsort_large.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.my3DVertexStruct = type { i32, i32, i32, double }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c" [target finished!]\0A\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c" [target] Execution Time: %ld\0A\00", align 1
@is_signature_queue_full = external global i32, align 4

; Function Attrs: noinline nounwind optnone uwtable
define i32 @compare(i8*, i8*) #0 {
  call void @enqueue_signature(i32 65537)
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to %struct.my3DVertexStruct*
  %9 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %8, i32 0, i32 3
  %10 = load double, double* %9, align 8
  store double %10, double* %5, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = bitcast i8* %11 to %struct.my3DVertexStruct*
  %13 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %12, i32 0, i32 3
  %14 = load double, double* %13, align 8
  store double %14, double* %6, align 8
  %15 = load double, double* %5, align 8
  %16 = load double, double* %6, align 8
  %17 = fcmp ogt double %15, %16
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %2
  call void @enqueue_signature(i32 65538)
  br label %25

; <label>:19:                                     ; preds = %2
  call void @enqueue_signature(i32 65539)
  %20 = load double, double* %5, align 8
  %21 = load double, double* %6, align 8
  %22 = fcmp oeq double %20, %21
  %23 = zext i1 %22 to i64
  %24 = select i1 %22, i32 0, i32 -1
  br label %25

; <label>:25:                                     ; preds = %19, %18
  %26 = phi i32 [ 1, %18 ], [ %24, %19 ]
  call void @enqueue_signature_with_return(i32 65540)
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32, i8**) #0 {
  call void @init_monitor()
  call void @enqueue_signature(i32 131073)
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca [60000 x %struct.my3DVertexStruct], align 16
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.timeval, align 8
  %14 = alloca %struct.timeval, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %9, align 4
  %15 = call i32 @gettimeofday(%struct.timeval* %13, %struct.timezone* null) #3
  br label %16

; <label>:16:                                     ; preds = %2
  call void @enqueue_signature(i32 131074)
  %17 = load i32, i32* %4, align 4
  %18 = icmp slt i32 %17, 2
  br i1 %18, label %19, label %22

; <label>:19:                                     ; preds = %16
  call void @enqueue_signature(i32 131075)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0))
  br label %87

; <label>:22:                                     ; preds = %16
  call void @enqueue_signature(i32 131076)
  %23 = load i8**, i8*** %5, align 8
  %24 = getelementptr inbounds i8*, i8** %23, i64 1
  %25 = load i8*, i8** %24, align 8
  %26 = call %struct._IO_FILE* @fopen(i8* %25, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %27

; <label>:27:                                     ; preds = %22
  call void @enqueue_signature(i32 131077)
  store %struct._IO_FILE* %26, %struct._IO_FILE** %7, align 8
  br label %28

; <label>:28:                                     ; preds = %79, %27
  call void @enqueue_signature(i32 131078)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %10)
  br label %31

; <label>:31:                                     ; preds = %28
  call void @enqueue_signature(i32 131079)
  %32 = icmp eq i32 %30, 1
  br i1 %32, label %33, label %46

; <label>:33:                                     ; preds = %31
  call void @enqueue_signature(i32 131080)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %11)
  br label %36

; <label>:36:                                     ; preds = %33
  call void @enqueue_signature(i32 131081)
  %37 = icmp eq i32 %35, 1
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %36
  call void @enqueue_signature(i32 131082)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %12)
  br label %41

; <label>:41:                                     ; preds = %38
  call void @enqueue_signature(i32 131083)
  %42 = icmp eq i32 %40, 1
  br i1 %42, label %43, label %46

; <label>:43:                                     ; preds = %41
  call void @enqueue_signature(i32 131084)
  %44 = load i32, i32* %9, align 4
  %45 = icmp slt i32 %44, 60000
  br label %46

; <label>:46:                                     ; preds = %43, %41, %36, %31
  %47 = phi i1 [ false, %41 ], [ false, %36 ], [ false, %31 ], [ %45, %43 ]
  call void @enqueue_signature(i32 131085)
  br i1 %47, label %48, label %86

; <label>:48:                                     ; preds = %46
  call void @enqueue_signature(i32 131086)
  %49 = load i32, i32* %10, align 4
  %50 = load i32, i32* %9, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %51
  %53 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %52, i32 0, i32 0
  store i32 %49, i32* %53, align 8
  %54 = load i32, i32* %11, align 4
  %55 = load i32, i32* %9, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %57, i32 0, i32 1
  store i32 %54, i32* %58, align 4
  %59 = load i32, i32* %12, align 4
  %60 = load i32, i32* %9, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %61
  %63 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %62, i32 0, i32 2
  store i32 %59, i32* %63, align 8
  %64 = load i32, i32* %10, align 4
  %65 = sitofp i32 %64 to double
  %66 = call double @pow(double %65, double 2.000000e+00) #3
  br label %67

; <label>:67:                                     ; preds = %48
  call void @enqueue_signature(i32 131087)
  %68 = load i32, i32* %11, align 4
  %69 = sitofp i32 %68 to double
  %70 = call double @pow(double %69, double 2.000000e+00) #3
  br label %71

; <label>:71:                                     ; preds = %67
  call void @enqueue_signature(i32 131088)
  %72 = fadd double %66, %70
  %73 = load i32, i32* %12, align 4
  %74 = sitofp i32 %73 to double
  %75 = call double @pow(double %74, double 2.000000e+00) #3
  br label %76

; <label>:76:                                     ; preds = %71
  call void @enqueue_signature(i32 131089)
  %77 = fadd double %72, %75
  %78 = call double @sqrt(double %77) #3
  br label %79

; <label>:79:                                     ; preds = %76
  call void @enqueue_signature(i32 131090)
  %80 = load i32, i32* %9, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %81
  %83 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %82, i32 0, i32 3
  store double %78, double* %83, align 8
  %84 = load i32, i32* %9, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %9, align 4
  br label %28

; <label>:86:                                     ; preds = %46
  call void @enqueue_signature(i32 131091)
  br label %87

; <label>:87:                                     ; preds = %86, %19
  call void @enqueue_signature(i32 131092)
  %88 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i32 0, i32 0
  %89 = bitcast %struct.my3DVertexStruct* %88 to i8*
  %90 = load i32, i32* %9, align 4
  %91 = sext i32 %90 to i64
  call void @qsort(i8* %89, i64 %91, i64 24, i32 (i8*, i8*)* @compare)
  br label %92

; <label>:92:                                     ; preds = %87
  call void @enqueue_signature(i32 131093)
  %93 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0))
  br label %94

; <label>:94:                                     ; preds = %92
  call void @enqueue_signature(i32 131094)
  %95 = call i32 @gettimeofday(%struct.timeval* %14, %struct.timezone* null) #3
  br label %96

; <label>:96:                                     ; preds = %94
  call void @enqueue_signature(i32 131095)
  %97 = getelementptr inbounds %struct.timeval, %struct.timeval* %14, i32 0, i32 0
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds %struct.timeval, %struct.timeval* %13, i32 0, i32 0
  %100 = load i64, i64* %99, align 8
  %101 = sub nsw i64 %98, %100
  %102 = mul nsw i64 %101, 1000000
  %103 = getelementptr inbounds %struct.timeval, %struct.timeval* %14, i32 0, i32 1
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds %struct.timeval, %struct.timeval* %13, i32 0, i32 1
  %106 = load i64, i64* %105, align 8
  %107 = sub nsw i64 %104, %106
  %108 = add nsw i64 %102, %107
  %109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0), i64 %108)
  br label %110

; <label>:110:                                    ; preds = %96
  call void @enqueue_signature_with_remainder_process(i32 131096)
  store i32 1, i32* @is_signature_queue_full, align 4
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare double @pow(double, double) #1

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #2

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
