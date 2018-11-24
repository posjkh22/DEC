; ModuleID = 'bitcount.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%union.anon = type { i64 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.bfile = type { %struct._IO_FILE*, i8, i8, i8, i8 }

@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@bits.1 = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [29 x i8] c"Usage: bitcnts <iterations>\0A\00", align 1
@main.pBitCntFunc = internal global [7 x i32 (i64)*] [i32 (i64)* @bit_count, i32 (i64)* @bitcount, i32 (i64)* @ntbl_bitcnt, i32 (i64)* @ntbl_bitcount, i32 (i64)* @BW_btbl_bitcount, i32 (i64)* @AR_btbl_bitcount, i32 (i64)* @bit_shifter], align 16
@.str.8 = private unnamed_addr constant [21 x i8] c" [target finished!]\0A\00", align 1
@.str.9 = private unnamed_addr constant [31 x i8] c" [target] Execution Time: %ld\0A\00", align 1
@is_signature_queue_full = external global i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"01\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @bit_count(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  store i32 0, i32* %3, align 4
  %4 = load i64, i64* %2, align 8
  %5 = icmp ne i64 %4, 0
  br i1 %5, label %6, label %17

; <label>:6:                                      ; preds = %1
  br label %7

; <label>:7:                                      ; preds = %10, %6
  %8 = load i32, i32* %3, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %3, align 4
  br label %10

; <label>:10:                                     ; preds = %7
  %11 = load i64, i64* %2, align 8
  %12 = load i64, i64* %2, align 8
  %13 = sub nsw i64 %12, 1
  %14 = and i64 %11, %13
  store i64 %14, i64* %2, align 8
  %15 = icmp ne i64 0, %14
  br i1 %15, label %7, label %16

; <label>:16:                                     ; preds = %10
  br label %17

; <label>:17:                                     ; preds = %16, %1
  %18 = load i32, i32* %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @bitcount(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = and i64 %3, 2863311530
  %5 = ashr i64 %4, 1
  %6 = load i64, i64* %2, align 8
  %7 = and i64 %6, 1431655765
  %8 = add nsw i64 %5, %7
  store i64 %8, i64* %2, align 8
  %9 = load i64, i64* %2, align 8
  %10 = and i64 %9, 3435973836
  %11 = ashr i64 %10, 2
  %12 = load i64, i64* %2, align 8
  %13 = and i64 %12, 858993459
  %14 = add nsw i64 %11, %13
  store i64 %14, i64* %2, align 8
  %15 = load i64, i64* %2, align 8
  %16 = and i64 %15, 4042322160
  %17 = ashr i64 %16, 4
  %18 = load i64, i64* %2, align 8
  %19 = and i64 %18, 252645135
  %20 = add nsw i64 %17, %19
  store i64 %20, i64* %2, align 8
  %21 = load i64, i64* %2, align 8
  %22 = and i64 %21, 4278255360
  %23 = ashr i64 %22, 8
  %24 = load i64, i64* %2, align 8
  %25 = and i64 %24, 16711935
  %26 = add nsw i64 %23, %25
  store i64 %26, i64* %2, align 8
  %27 = load i64, i64* %2, align 8
  %28 = and i64 %27, 4294901760
  %29 = ashr i64 %28, 16
  %30 = load i64, i64* %2, align 8
  %31 = and i64 %30, 65535
  %32 = add nsw i64 %29, %31
  store i64 %32, i64* %2, align 8
  %33 = load i64, i64* %2, align 8
  %34 = trunc i64 %33 to i32
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @ntbl_bitcount(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = and i64 %3, 15
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %6
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = load i64, i64* %2, align 8
  %11 = and i64 %10, 240
  %12 = lshr i64 %11, 4
  %13 = trunc i64 %12 to i32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = add nsw i32 %9, %17
  %19 = load i64, i64* %2, align 8
  %20 = and i64 %19, 3840
  %21 = lshr i64 %20, 8
  %22 = trunc i64 %21 to i32
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %23
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = add nsw i32 %18, %26
  %28 = load i64, i64* %2, align 8
  %29 = and i64 %28, 61440
  %30 = lshr i64 %29, 12
  %31 = trunc i64 %30 to i32
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = add nsw i32 %27, %35
  %37 = load i64, i64* %2, align 8
  %38 = and i64 %37, 983040
  %39 = lshr i64 %38, 16
  %40 = trunc i64 %39 to i32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = add nsw i32 %36, %44
  %46 = load i64, i64* %2, align 8
  %47 = and i64 %46, 15728640
  %48 = lshr i64 %47, 20
  %49 = trunc i64 %48 to i32
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %50
  %52 = load i8, i8* %51, align 1
  %53 = sext i8 %52 to i32
  %54 = add nsw i32 %45, %53
  %55 = load i64, i64* %2, align 8
  %56 = and i64 %55, 251658240
  %57 = lshr i64 %56, 24
  %58 = trunc i64 %57 to i32
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = add nsw i32 %54, %62
  %64 = load i64, i64* %2, align 8
  %65 = and i64 %64, 4026531840
  %66 = lshr i64 %65, 28
  %67 = trunc i64 %66 to i32
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %68
  %70 = load i8, i8* %69, align 1
  %71 = sext i8 %70 to i32
  %72 = add nsw i32 %63, %71
  ret i32 %72
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @BW_btbl_bitcount(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %union.anon, align 8
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = bitcast %union.anon* %3 to i64*
  store i64 %4, i64* %5, align 8
  %6 = bitcast %union.anon* %3 to [4 x i8]*
  %7 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  %8 = load i8, i8* %7, align 8
  %9 = zext i8 %8 to i64
  %10 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %9
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = bitcast %union.anon* %3 to [4 x i8]*
  %14 = getelementptr inbounds [4 x i8], [4 x i8]* %13, i64 0, i64 1
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i64
  %17 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = add nsw i32 %12, %19
  %21 = bitcast %union.anon* %3 to [4 x i8]*
  %22 = getelementptr inbounds [4 x i8], [4 x i8]* %21, i64 0, i64 3
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i64
  %25 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %24
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = add nsw i32 %20, %27
  %29 = bitcast %union.anon* %3 to [4 x i8]*
  %30 = getelementptr inbounds [4 x i8], [4 x i8]* %29, i64 0, i64 2
  %31 = load i8, i8* %30, align 2
  %32 = zext i8 %31 to i64
  %33 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = add nsw i32 %28, %35
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @AR_btbl_bitcount(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  %5 = bitcast i64* %2 to i8*
  store i8* %5, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %7, i8** %3, align 8
  %8 = load i8, i8* %6, align 1
  %9 = zext i8 %8 to i64
  %10 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %9
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  store i32 %12, i32* %4, align 4
  %13 = load i8*, i8** %3, align 8
  %14 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %14, i8** %3, align 8
  %15 = load i8, i8* %13, align 1
  %16 = zext i8 %15 to i64
  %17 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = load i32, i32* %4, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, i32* %4, align 4
  %22 = load i8*, i8** %3, align 8
  %23 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %23, i8** %3, align 8
  %24 = load i8, i8* %22, align 1
  %25 = zext i8 %24 to i64
  %26 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = load i32, i32* %4, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, i32* %4, align 4
  %31 = load i8*, i8** %3, align 8
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i64
  %34 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = load i32, i32* %4, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, i32* %4, align 4
  %39 = load i32, i32* %4, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @ntbl_bitcnt(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = and i64 %4, 15
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [256 x i8], [256 x i8]* @bits.1, i64 0, i64 %7
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  store i32 %10, i32* %3, align 4
  %11 = load i64, i64* %2, align 8
  %12 = ashr i64 %11, 4
  store i64 %12, i64* %2, align 8
  %13 = icmp ne i64 0, %12
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %1
  %15 = load i64, i64* %2, align 8
  %16 = call i32 @ntbl_bitcnt(i64 %15)
  %17 = load i32, i32* %3, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, i32* %3, align 4
  br label %19

; <label>:19:                                     ; preds = %14, %1
  %20 = load i32, i32* %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @btbl_bitcnt(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  %4 = bitcast i64* %2 to i8*
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %6 = load i8, i8* %5, align 8
  %7 = sext i8 %6 to i32
  %8 = and i32 %7, 255
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [256 x i8], [256 x i8]* @bits.1, i64 0, i64 %9
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  store i32 %12, i32* %3, align 4
  %13 = load i64, i64* %2, align 8
  %14 = ashr i64 %13, 8
  store i64 %14, i64* %2, align 8
  %15 = icmp ne i64 0, %14
  br i1 %15, label %16, label %21

; <label>:16:                                     ; preds = %1
  %17 = load i64, i64* %2, align 8
  %18 = call i32 @btbl_bitcnt(i64 %17)
  %19 = load i32, i32* %3, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, i32* %3, align 4
  br label %21

; <label>:21:                                     ; preds = %16, %1
  %22 = load i32, i32* %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  %18 = alloca %struct.timeval, align 8
  %19 = alloca %struct.timeval, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store double 0x7FEFFFFFFFFFFFFF, double* %9, align 8
  store double 0.000000e+00, double* %10, align 8
  %20 = call i32 @gettimeofday(%struct.timeval* %18, %struct.timezone* null) #5
  %21 = load i32, i32* %4, align 4
  %22 = icmp slt i32 %21, 2
  br i1 %22, label %23, label %26

; <label>:23:                                     ; preds = %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 -1) #6
  unreachable

; <label>:26:                                     ; preds = %2
  %27 = load i8**, i8*** %5, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 1
  %29 = load i8*, i8** %28, align 8
  %30 = call i32 @atoi(i8* %29) #7
  store i32 %30, i32* %17, align 4
  store i32 0, i32* %11, align 4
  br label %31

; <label>:31:                                     ; preds = %79, %26
  %32 = load i32, i32* %11, align 4
  %33 = icmp slt i32 %32, 7
  br i1 %33, label %34, label %82

; <label>:34:                                     ; preds = %31
  %35 = call i64 @clock() #5
  store i64 %35, i64* %6, align 8
  store i64 0, i64* %15, align 8
  store i64 0, i64* %14, align 8
  %36 = call i32 @rand() #5
  %37 = sext i32 %36 to i64
  store i64 %37, i64* %16, align 8
  br label %38

; <label>:38:                                     ; preds = %53, %34
  %39 = load i64, i64* %14, align 8
  %40 = load i32, i32* %17, align 4
  %41 = sext i32 %40 to i64
  %42 = icmp slt i64 %39, %41
  br i1 %42, label %43, label %58

; <label>:43:                                     ; preds = %38
  %44 = load i32, i32* %11, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [7 x i32 (i64)*], [7 x i32 (i64)*]* @main.pBitCntFunc, i64 0, i64 %45
  %47 = load i32 (i64)*, i32 (i64)** %46, align 8
  %48 = load i64, i64* %16, align 8
  %49 = call i32 %47(i64 %48)
  %50 = sext i32 %49 to i64
  %51 = load i64, i64* %15, align 8
  %52 = add nsw i64 %51, %50
  store i64 %52, i64* %15, align 8
  br label %53

; <label>:53:                                     ; preds = %43
  %54 = load i64, i64* %14, align 8
  %55 = add nsw i64 %54, 1
  store i64 %55, i64* %14, align 8
  %56 = load i64, i64* %16, align 8
  %57 = add nsw i64 %56, 13
  store i64 %57, i64* %16, align 8
  br label %38

; <label>:58:                                     ; preds = %38
  %59 = call i64 @clock() #5
  store i64 %59, i64* %7, align 8
  %60 = load i64, i64* %7, align 8
  %61 = load i64, i64* %6, align 8
  %62 = sub nsw i64 %60, %61
  %63 = sitofp i64 %62 to double
  %64 = fdiv double %63, 1.000000e+06
  store double %64, double* %8, align 8
  %65 = load double, double* %8, align 8
  %66 = load double, double* %9, align 8
  %67 = fcmp olt double %65, %66
  br i1 %67, label %68, label %71

; <label>:68:                                     ; preds = %58
  %69 = load double, double* %8, align 8
  store double %69, double* %9, align 8
  %70 = load i32, i32* %11, align 4
  store i32 %70, i32* %12, align 4
  br label %71

; <label>:71:                                     ; preds = %68, %58
  %72 = load double, double* %8, align 8
  %73 = load double, double* %10, align 8
  %74 = fcmp ogt double %72, %73
  br i1 %74, label %75, label %78

; <label>:75:                                     ; preds = %71
  %76 = load double, double* %8, align 8
  store double %76, double* %10, align 8
  %77 = load i32, i32* %11, align 4
  store i32 %77, i32* %13, align 4
  br label %78

; <label>:78:                                     ; preds = %75, %71
  br label %79

; <label>:79:                                     ; preds = %78
  %80 = load i32, i32* %11, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %11, align 4
  br label %31

; <label>:82:                                     ; preds = %31
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i32 0, i32 0))
  %84 = call i32 @gettimeofday(%struct.timeval* %19, %struct.timezone* null) #5
  %85 = getelementptr inbounds %struct.timeval, %struct.timeval* %19, i32 0, i32 0
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds %struct.timeval, %struct.timeval* %18, i32 0, i32 0
  %88 = load i64, i64* %87, align 8
  %89 = sub nsw i64 %86, %88
  %90 = mul nsw i64 %89, 1000000
  %91 = getelementptr inbounds %struct.timeval, %struct.timeval* %19, i32 0, i32 1
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds %struct.timeval, %struct.timeval* %18, i32 0, i32 1
  %94 = load i64, i64* %93, align 8
  %95 = sub nsw i64 %92, %94
  %96 = add nsw i64 %90, %95
  %97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.9, i32 0, i32 0), i64 %96)
  store i32 1, i32* @is_signature_queue_full, align 4
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

; Function Attrs: nounwind
declare i64 @clock() #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @bit_shifter(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  store i32 0, i32* %4, align 4
  store i32 0, i32* %3, align 4
  br label %5

; <label>:5:                                      ; preds = %20, %1
  %6 = load i64, i64* %2, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %3, align 4
  %10 = sext i32 %9 to i64
  %11 = icmp ult i64 %10, 64
  br label %12

; <label>:12:                                     ; preds = %8, %5
  %13 = phi i1 [ false, %5 ], [ %11, %8 ]
  br i1 %13, label %14, label %25

; <label>:14:                                     ; preds = %12
  %15 = load i64, i64* %2, align 8
  %16 = and i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = load i32, i32* %4, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, i32* %4, align 4
  br label %20

; <label>:20:                                     ; preds = %14
  %21 = load i32, i32* %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %3, align 4
  %23 = load i64, i64* %2, align 8
  %24 = ashr i64 %23, 1
  store i64 %24, i64* %2, align 8
  br label %5

; <label>:25:                                     ; preds = %12
  %26 = load i32, i32* %4, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define %struct.bfile* @bfopen(i8*, i8*) #0 {
  %3 = alloca %struct.bfile*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.bfile*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %7 = call noalias i8* @malloc(i64 16) #5
  %8 = bitcast i8* %7 to %struct.bfile*
  store %struct.bfile* %8, %struct.bfile** %6, align 8
  %9 = load %struct.bfile*, %struct.bfile** %6, align 8
  %10 = icmp eq %struct.bfile* null, %9
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %2
  store %struct.bfile* null, %struct.bfile** %3, align 8
  br label %31

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %4, align 8
  %14 = load i8*, i8** %5, align 8
  %15 = call %struct._IO_FILE* @fopen(i8* %13, i8* %14)
  %16 = load %struct.bfile*, %struct.bfile** %6, align 8
  %17 = getelementptr inbounds %struct.bfile, %struct.bfile* %16, i32 0, i32 0
  store %struct._IO_FILE* %15, %struct._IO_FILE** %17, align 8
  %18 = load %struct.bfile*, %struct.bfile** %6, align 8
  %19 = getelementptr inbounds %struct.bfile, %struct.bfile* %18, i32 0, i32 0
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %21 = icmp eq %struct._IO_FILE* null, %20
  br i1 %21, label %22, label %25

; <label>:22:                                     ; preds = %12
  %23 = load %struct.bfile*, %struct.bfile** %6, align 8
  %24 = bitcast %struct.bfile* %23 to i8*
  call void @free(i8* %24) #5
  store %struct.bfile* null, %struct.bfile** %3, align 8
  br label %31

; <label>:25:                                     ; preds = %12
  %26 = load %struct.bfile*, %struct.bfile** %6, align 8
  %27 = getelementptr inbounds %struct.bfile, %struct.bfile* %26, i32 0, i32 2
  store i8 0, i8* %27, align 1
  %28 = load %struct.bfile*, %struct.bfile** %6, align 8
  %29 = getelementptr inbounds %struct.bfile, %struct.bfile* %28, i32 0, i32 4
  store i8 0, i8* %29, align 1
  %30 = load %struct.bfile*, %struct.bfile** %6, align 8
  store %struct.bfile* %30, %struct.bfile** %3, align 8
  br label %31

; <label>:31:                                     ; preds = %25, %22, %11
  %32 = load %struct.bfile*, %struct.bfile** %3, align 8
  ret %struct.bfile* %32
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @bfread(%struct.bfile*) #0 {
  %2 = alloca %struct.bfile*, align 8
  store %struct.bfile* %0, %struct.bfile** %2, align 8
  %3 = load %struct.bfile*, %struct.bfile** %2, align 8
  %4 = getelementptr inbounds %struct.bfile, %struct.bfile* %3, i32 0, i32 2
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 0, %6
  br i1 %7, label %8, label %18

; <label>:8:                                      ; preds = %1
  %9 = load %struct.bfile*, %struct.bfile** %2, align 8
  %10 = getelementptr inbounds %struct.bfile, %struct.bfile* %9, i32 0, i32 0
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %12 = call i32 @fgetc(%struct._IO_FILE* %11)
  %13 = trunc i32 %12 to i8
  %14 = load %struct.bfile*, %struct.bfile** %2, align 8
  %15 = getelementptr inbounds %struct.bfile, %struct.bfile* %14, i32 0, i32 1
  store i8 %13, i8* %15, align 8
  %16 = load %struct.bfile*, %struct.bfile** %2, align 8
  %17 = getelementptr inbounds %struct.bfile, %struct.bfile* %16, i32 0, i32 2
  store i8 8, i8* %17, align 1
  br label %18

; <label>:18:                                     ; preds = %8, %1
  %19 = load %struct.bfile*, %struct.bfile** %2, align 8
  %20 = getelementptr inbounds %struct.bfile, %struct.bfile* %19, i32 0, i32 2
  %21 = load i8, i8* %20, align 1
  %22 = add i8 %21, -1
  store i8 %22, i8* %20, align 1
  %23 = load %struct.bfile*, %struct.bfile** %2, align 8
  %24 = getelementptr inbounds %struct.bfile, %struct.bfile* %23, i32 0, i32 1
  %25 = load i8, i8* %24, align 8
  %26 = sext i8 %25 to i32
  %27 = load %struct.bfile*, %struct.bfile** %2, align 8
  %28 = getelementptr inbounds %struct.bfile, %struct.bfile* %27, i32 0, i32 2
  %29 = load i8, i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = shl i32 1, %30
  %32 = and i32 %26, %31
  %33 = icmp ne i32 %32, 0
  %34 = zext i1 %33 to i32
  ret i32 %34
}

declare i32 @fgetc(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind optnone uwtable
define void @bfwrite(i32, %struct.bfile*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.bfile*, align 8
  store i32 %0, i32* %3, align 4
  store %struct.bfile* %1, %struct.bfile** %4, align 8
  %5 = load %struct.bfile*, %struct.bfile** %4, align 8
  %6 = getelementptr inbounds %struct.bfile, %struct.bfile* %5, i32 0, i32 4
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 8, %8
  br i1 %9, label %10, label %21

; <label>:10:                                     ; preds = %2
  %11 = load %struct.bfile*, %struct.bfile** %4, align 8
  %12 = getelementptr inbounds %struct.bfile, %struct.bfile* %11, i32 0, i32 3
  %13 = load i8, i8* %12, align 2
  %14 = sext i8 %13 to i32
  %15 = load %struct.bfile*, %struct.bfile** %4, align 8
  %16 = getelementptr inbounds %struct.bfile, %struct.bfile* %15, i32 0, i32 0
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %18 = call i32 @fputc(i32 %14, %struct._IO_FILE* %17)
  %19 = load %struct.bfile*, %struct.bfile** %4, align 8
  %20 = getelementptr inbounds %struct.bfile, %struct.bfile* %19, i32 0, i32 4
  store i8 0, i8* %20, align 1
  br label %21

; <label>:21:                                     ; preds = %10, %2
  %22 = load %struct.bfile*, %struct.bfile** %4, align 8
  %23 = getelementptr inbounds %struct.bfile, %struct.bfile* %22, i32 0, i32 4
  %24 = load i8, i8* %23, align 1
  %25 = add i8 %24, 1
  store i8 %25, i8* %23, align 1
  %26 = load %struct.bfile*, %struct.bfile** %4, align 8
  %27 = getelementptr inbounds %struct.bfile, %struct.bfile* %26, i32 0, i32 3
  %28 = load i8, i8* %27, align 2
  %29 = sext i8 %28 to i32
  %30 = shl i32 %29, 1
  %31 = trunc i32 %30 to i8
  store i8 %31, i8* %27, align 2
  %32 = load i32, i32* %3, align 4
  %33 = and i32 %32, 1
  %34 = load %struct.bfile*, %struct.bfile** %4, align 8
  %35 = getelementptr inbounds %struct.bfile, %struct.bfile* %34, i32 0, i32 3
  %36 = load i8, i8* %35, align 2
  %37 = sext i8 %36 to i32
  %38 = or i32 %37, %33
  %39 = trunc i32 %38 to i8
  store i8 %39, i8* %35, align 2
  ret void
}

declare i32 @fputc(i32, %struct._IO_FILE*) #2

; Function Attrs: noinline nounwind optnone uwtable
define void @bfclose(%struct.bfile*) #0 {
  %2 = alloca %struct.bfile*, align 8
  store %struct.bfile* %0, %struct.bfile** %2, align 8
  %3 = load %struct.bfile*, %struct.bfile** %2, align 8
  %4 = getelementptr inbounds %struct.bfile, %struct.bfile* %3, i32 0, i32 0
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %6 = call i32 @fclose(%struct._IO_FILE* %5)
  %7 = load %struct.bfile*, %struct.bfile** %2, align 8
  %8 = bitcast %struct.bfile* %7 to i8*
  call void @free(i8* %8) #5
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind optnone uwtable
define void @bitstring(i8*, i64, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i64 %1, i64* %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %11 = load i32, i32* %8, align 4
  %12 = load i32, i32* %7, align 4
  %13 = load i32, i32* %7, align 4
  %14 = ashr i32 %13, 2
  %15 = add nsw i32 %12, %14
  %16 = load i32, i32* %7, align 4
  %17 = srem i32 %16, 4
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i64
  %20 = select i1 %18, i32 0, i32 1
  %21 = sub nsw i32 %15, %20
  %22 = sub nsw i32 %11, %21
  store i32 %22, i32* %10, align 4
  store i32 0, i32* %9, align 4
  br label %23

; <label>:23:                                     ; preds = %30, %4
  %24 = load i32, i32* %9, align 4
  %25 = load i32, i32* %10, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %33

; <label>:27:                                     ; preds = %23
  %28 = load i8*, i8** %5, align 8
  %29 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %29, i8** %5, align 8
  store i8 32, i8* %28, align 1
  br label %30

; <label>:30:                                     ; preds = %27
  %31 = load i32, i32* %9, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %9, align 4
  br label %23

; <label>:33:                                     ; preds = %23
  br label %34

; <label>:34:                                     ; preds = %57, %33
  %35 = load i32, i32* %7, align 4
  %36 = add nsw i32 %35, -1
  store i32 %36, i32* %7, align 4
  %37 = icmp sge i32 %36, 0
  br i1 %37, label %38, label %58

; <label>:38:                                     ; preds = %34
  %39 = load i64, i64* %6, align 8
  %40 = load i32, i32* %7, align 4
  %41 = zext i32 %40 to i64
  %42 = ashr i64 %39, %41
  %43 = and i64 %42, 1
  %44 = add nsw i64 %43, 48
  %45 = trunc i64 %44 to i8
  %46 = load i8*, i8** %5, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %5, align 8
  store i8 %45, i8* %46, align 1
  %48 = load i32, i32* %7, align 4
  %49 = srem i32 %48, 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %57, label %51

; <label>:51:                                     ; preds = %38
  %52 = load i32, i32* %7, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %57

; <label>:54:                                     ; preds = %51
  %55 = load i8*, i8** %5, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %5, align 8
  store i8 32, i8* %55, align 1
  br label %57

; <label>:57:                                     ; preds = %54, %51, %38
  br label %34

; <label>:58:                                     ; preds = %34
  %59 = load i8*, i8** %5, align 8
  store i8 0, i8* %59, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @bstr_i(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %21, %1
  %6 = load i8*, i8** %2, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %8, label %19

; <label>:8:                                      ; preds = %5
  %9 = load i8*, i8** %2, align 8
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %19

; <label>:13:                                     ; preds = %8
  %14 = load i8*, i8** %2, align 8
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = call i8* @strchr(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32 %16) #7
  %18 = icmp ne i8* %17, null
  br label %19

; <label>:19:                                     ; preds = %13, %8, %5
  %20 = phi i1 [ false, %8 ], [ false, %5 ], [ %18, %13 ]
  br i1 %20, label %21, label %33

; <label>:21:                                     ; preds = %19
  %22 = load i8*, i8** %2, align 8
  %23 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %23, i8** %2, align 8
  %24 = load i8, i8* %22, align 1
  %25 = sext i8 %24 to i32
  %26 = sub nsw i32 %25, 48
  store i32 %26, i32* %3, align 4
  %27 = load i32, i32* %4, align 4
  %28 = shl i32 %27, 1
  store i32 %28, i32* %4, align 4
  %29 = load i32, i32* %3, align 4
  %30 = and i32 %29, 1
  %31 = load i32, i32* %4, align 4
  %32 = or i32 %31, %30
  store i32 %32, i32* %4, align 4
  br label %5

; <label>:33:                                     ; preds = %19
  %34 = load i32, i32* %4, align 4
  ret i32 %34
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #4

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
!1 = !{i32 1, !"wchar_size", i32 4}
