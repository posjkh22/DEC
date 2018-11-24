; ModuleID = 'qsort.bc'
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
  br label %25

; <label>:19:                                     ; preds = %2
  %20 = load double, double* %5, align 8
  %21 = load double, double* %6, align 8
  %22 = fcmp oeq double %20, %21
  %23 = zext i1 %22 to i64
  %24 = select i1 %22, i32 0, i32 -1
  br label %25

; <label>:25:                                     ; preds = %19, %18
  %26 = phi i32 [ 1, %18 ], [ %24, %19 ]
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32, i8**) #0 {
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
  %16 = load i32, i32* %4, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0))
  br label %78

; <label>:21:                                     ; preds = %2
  %22 = load i8**, i8*** %5, align 8
  %23 = getelementptr inbounds i8*, i8** %22, i64 1
  %24 = load i8*, i8** %23, align 8
  %25 = call %struct._IO_FILE* @fopen(i8* %24, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %25, %struct._IO_FILE** %7, align 8
  br label %26

; <label>:26:                                     ; preds = %43, %21
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %10)
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %41

; <label>:30:                                     ; preds = %26
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %11)
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %41

; <label>:34:                                     ; preds = %30
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %12)
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %38, label %41

; <label>:38:                                     ; preds = %34
  %39 = load i32, i32* %9, align 4
  %40 = icmp slt i32 %39, 60000
  br label %41

; <label>:41:                                     ; preds = %38, %34, %30, %26
  %42 = phi i1 [ false, %34 ], [ false, %30 ], [ false, %26 ], [ %40, %38 ]
  br i1 %42, label %43, label %77

; <label>:43:                                     ; preds = %41
  %44 = load i32, i32* %10, align 4
  %45 = load i32, i32* %9, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %46
  %48 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %47, i32 0, i32 0
  store i32 %44, i32* %48, align 8
  %49 = load i32, i32* %11, align 4
  %50 = load i32, i32* %9, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %51
  %53 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %52, i32 0, i32 1
  store i32 %49, i32* %53, align 4
  %54 = load i32, i32* %12, align 4
  %55 = load i32, i32* %9, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %57, i32 0, i32 2
  store i32 %54, i32* %58, align 8
  %59 = load i32, i32* %10, align 4
  %60 = sitofp i32 %59 to double
  %61 = call double @pow(double %60, double 2.000000e+00) #3
  %62 = load i32, i32* %11, align 4
  %63 = sitofp i32 %62 to double
  %64 = call double @pow(double %63, double 2.000000e+00) #3
  %65 = fadd double %61, %64
  %66 = load i32, i32* %12, align 4
  %67 = sitofp i32 %66 to double
  %68 = call double @pow(double %67, double 2.000000e+00) #3
  %69 = fadd double %65, %68
  %70 = call double @sqrt(double %69) #3
  %71 = load i32, i32* %9, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %72
  %74 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %73, i32 0, i32 3
  store double %70, double* %74, align 8
  %75 = load i32, i32* %9, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %9, align 4
  br label %26

; <label>:77:                                     ; preds = %41
  br label %78

; <label>:78:                                     ; preds = %77, %18
  %79 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i32 0, i32 0
  %80 = bitcast %struct.my3DVertexStruct* %79 to i8*
  %81 = load i32, i32* %9, align 4
  %82 = sext i32 %81 to i64
  call void @qsort(i8* %80, i64 %82, i64 24, i32 (i8*, i8*)* @compare)
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0))
  %84 = call i32 @gettimeofday(%struct.timeval* %14, %struct.timezone* null) #3
  %85 = getelementptr inbounds %struct.timeval, %struct.timeval* %14, i32 0, i32 0
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds %struct.timeval, %struct.timeval* %13, i32 0, i32 0
  %88 = load i64, i64* %87, align 8
  %89 = sub nsw i64 %86, %88
  %90 = mul nsw i64 %89, 1000000
  %91 = getelementptr inbounds %struct.timeval, %struct.timeval* %14, i32 0, i32 1
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds %struct.timeval, %struct.timeval* %13, i32 0, i32 1
  %94 = load i64, i64* %93, align 8
  %95 = sub nsw i64 %92, %94
  %96 = add nsw i64 %90, %95
  %97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0), i64 %96)
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

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
