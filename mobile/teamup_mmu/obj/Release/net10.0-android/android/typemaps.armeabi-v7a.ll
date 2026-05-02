; ModuleID = 'typemaps.armeabi-v7a.ll'
source_filename = "typemaps.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 38, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 1150, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [38 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x07, i8 u0x34, i8 u0x93, i8 u0x9c, i8 u0x29, i8 u0x73, i8 u0x92, i8 u0x49, i8 u0xae, i8 u0xfd, i8 u0x5c, i8 u0xe9, i8 u0x6f, i8 u0x54, i8 u0xf2, i8 u0x0c ], ; module_uuid: 9c933407-7329-4992-aefd-5ce96f54f20c
		i32 19, ; uint32_t entry_count
		i32 8, ; uint32_t duplicate_count
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module0_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: Xamarin.AndroidX.Activity
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x14, i8 u0xa0, i8 u0xd6, i8 u0xb6, i8 u0xfe, i8 u0xf6, i8 u0x3b, i8 u0x4f, i8 u0x98, i8 u0x67, i8 u0x7a, i8 u0xd7, i8 u0xb8, i8 u0xb8, i8 u0x07, i8 u0x10 ], ; module_uuid: b6d6a014-f6fe-4f3b-9867-7ad7b8b80710
		i32 68, ; uint32_t entry_count
		i32 25, ; uint32_t duplicate_count
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module1_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: Xamarin.Google.Android.Material
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 1
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x15, i8 u0x7a, i8 u0xb4, i8 u0xcc, i8 u0x7a, i8 u0xb7, i8 u0x81, i8 u0x45, i8 u0xa3, i8 u0x9c, i8 u0xe5, i8 u0x14, i8 u0xbc, i8 u0xd7, i8 u0x89, i8 u0x0e ], ; module_uuid: ccb47a15-b77a-4581-a39c-e514bcd7890e
		i32 3, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module2_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.2_assembly_name, ; assembly_name: Xamarin.AndroidX.Navigation.Fragment
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 2
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x17, i8 u0x63, i8 u0x1f, i8 u0x15, i8 u0x0c, i8 u0x88, i8 u0x81, i8 u0x47, i8 u0x86, i8 u0xbb, i8 u0x33, i8 u0x1c, i8 u0x95, i8 u0xe0, i8 u0xad, i8 u0xf2 ], ; module_uuid: 151f6317-880c-4781-86bb-331c95e0adf2
		i32 71, ; uint32_t entry_count
		i32 22, ; uint32_t duplicate_count
		ptr @module3_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module3_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.3_assembly_name, ; assembly_name: Xamarin.AndroidX.Core
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 3
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x1b, i8 u0x6e, i8 u0xf3, i8 u0x4b, i8 u0x66, i8 u0x9c, i8 u0x72, i8 u0x40, i8 u0xb7, i8 u0x35, i8 u0x16, i8 u0xa7, i8 u0x45, i8 u0xe0, i8 u0xd0, i8 u0x46 ], ; module_uuid: 4bf36e1b-9c66-4072-b735-16a745e0d046
		i32 17, ; uint32_t entry_count
		i32 5, ; uint32_t duplicate_count
		ptr @module4_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module4_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.4_assembly_name, ; assembly_name: Xamarin.AndroidX.Navigation.Common.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 4
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x1c, i8 u0x9c, i8 u0x77, i8 u0x5e, i8 u0x6a, i8 u0x9a, i8 u0x38, i8 u0x44, i8 u0x84, i8 u0x40, i8 u0xf5, i8 u0x34, i8 u0xaf, i8 u0xc0, i8 u0x00, i8 u0x2a ], ; module_uuid: 5e779c1c-9a6a-4438-8440-f534afc0002a
		i32 4, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module5_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module5_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.5_assembly_name, ; assembly_name: Xamarin.AndroidX.SwipeRefreshLayout
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 5
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x1d, i8 u0x16, i8 u0xc8, i8 u0xc2, i8 u0x5b, i8 u0x7f, i8 u0x5a, i8 u0x4e, i8 u0xa8, i8 u0x7b, i8 u0xbd, i8 u0xac, i8 u0x50, i8 u0xd6, i8 u0x43, i8 u0xae ], ; module_uuid: c2c8161d-7f5b-4e5a-a87b-bdac50d643ae
		i32 4, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module6_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module6_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.6_assembly_name, ; assembly_name: Xamarin.AndroidX.Navigation.UI
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 6
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x20, i8 u0x00, i8 u0xf4, i8 u0x4d, i8 u0xd5, i8 u0x56, i8 u0xba, i8 u0x47, i8 u0x90, i8 u0xb8, i8 u0x60, i8 u0xcd, i8 u0xec, i8 u0x5c, i8 u0x5d, i8 u0x93 ], ; module_uuid: 4df40020-56d5-47ba-90b8-60cdec5c5d93
		i32 1, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module7_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.7_assembly_name, ; assembly_name: Microsoft.Maui.Graphics
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 7
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x23, i8 u0x35, i8 u0x01, i8 u0xbd, i8 u0x57, i8 u0x5d, i8 u0xb2, i8 u0x43, i8 u0x8f, i8 u0xa9, i8 u0x43, i8 u0x77, i8 u0x25, i8 u0xbb, i8 u0x46, i8 u0x68 ], ; module_uuid: bd013523-5d57-43b2-8fa9-437725bb4668
		i32 1, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module8_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module8_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.8_assembly_name, ; assembly_name: Xamarin.AndroidX.CursorAdapter
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 8
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x24, i8 u0x21, i8 u0x77, i8 u0xc0, i8 u0xea, i8 u0x15, i8 u0x30, i8 u0x4c, i8 u0x82, i8 u0x0f, i8 u0xfd, i8 u0x44, i8 u0x0f, i8 u0x7c, i8 u0xa5, i8 u0xd6 ], ; module_uuid: c0772124-15ea-4c30-820f-fd440f7ca5d6
		i32 9, ; uint32_t entry_count
		i32 5, ; uint32_t duplicate_count
		ptr @module9_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module9_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.9_assembly_name, ; assembly_name: Xamarin.AndroidX.Lifecycle.ViewModel.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 9
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x2b, i8 u0xb0, i8 u0xe7, i8 u0x47, i8 u0x34, i8 u0x3a, i8 u0x96, i8 u0x46, i8 u0x96, i8 u0xaf, i8 u0x19, i8 u0x9a, i8 u0xca, i8 u0xb2, i8 u0xc9, i8 u0xf6 ], ; module_uuid: 47e7b02b-3a34-4696-96af-199acab2c9f6
		i32 1, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module10_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.10_assembly_name, ; assembly_name: Xamarin.AndroidX.CardView
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 10
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x2b, i8 u0xfe, i8 u0x42, i8 u0x51, i8 u0x9e, i8 u0x7a, i8 u0xfd, i8 u0x44, i8 u0xb1, i8 u0x64, i8 u0xca, i8 u0x12, i8 u0x05, i8 u0x05, i8 u0x5f, i8 u0x9d ], ; module_uuid: 5142fe2b-7a9e-44fd-b164-ca1205055f9d
		i32 80, ; uint32_t entry_count
		i32 6, ; uint32_t duplicate_count
		ptr @module11_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module11_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.11_assembly_name, ; assembly_name: Microsoft.Maui
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 11
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x43, i8 u0x74, i8 u0x4a, i8 u0xdb, i8 u0xb3, i8 u0xb0, i8 u0x49, i8 u0x4c, i8 u0x81, i8 u0xa8, i8 u0x5d, i8 u0xe0, i8 u0xa9, i8 u0x7e, i8 u0xca, i8 u0x42 ], ; module_uuid: db4a7443-b0b3-4c49-81a8-5de0a97eca42
		i32 5, ; uint32_t entry_count
		i32 4, ; uint32_t duplicate_count
		ptr @module12_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module12_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.12_assembly_name, ; assembly_name: Xamarin.AndroidX.Loader
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 12
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x45, i8 u0x21, i8 u0x8b, i8 u0x33, i8 u0x33, i8 u0x69, i8 u0xc8, i8 u0x4a, i8 u0xa1, i8 u0x28, i8 u0x27, i8 u0x50, i8 u0x96, i8 u0xd4, i8 u0xd8, i8 u0x23 ], ; module_uuid: 338b2145-6933-4ac8-a128-275096d4d823
		i32 3, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module13_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module13_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.13_assembly_name, ; assembly_name: Xamarin.AndroidX.Lifecycle.LiveData.Core
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 13
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x49, i8 u0x1b, i8 u0xa5, i8 u0x70, i8 u0x1d, i8 u0x97, i8 u0xe4, i8 u0x4e, i8 u0xa2, i8 u0xf8, i8 u0x7d, i8 u0x4b, i8 u0x8a, i8 u0xeb, i8 u0x9c, i8 u0x05 ], ; module_uuid: 70a51b49-971d-4ee4-a2f8-7d4b8aeb9c05
		i32 6, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module14_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module14_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.14_assembly_name, ; assembly_name: Xamarin.AndroidX.Navigation.Runtime.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 14
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x4d, i8 u0xe7, i8 u0x52, i8 u0x43, i8 u0xcb, i8 u0xaf, i8 u0x34, i8 u0x49, i8 u0x8c, i8 u0xd1, i8 u0xff, i8 u0x5d, i8 u0x13, i8 u0x3b, i8 u0xbc, i8 u0x79 ], ; module_uuid: 4352e74d-afcb-4934-8cd1-ff5d133bbc79
		i32 1, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module15_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module15_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.15_assembly_name, ; assembly_name: Xamarin.AndroidX.CustomView
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 15
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x5f, i8 u0xd6, i8 u0x87, i8 u0x95, i8 u0x04, i8 u0x04, i8 u0xe8, i8 u0x41, i8 u0x83, i8 u0x2c, i8 u0xe9, i8 u0xbe, i8 u0x1e, i8 u0xd1, i8 u0x83, i8 u0x3f ], ; module_uuid: 9587d65f-0404-41e8-832c-e9be1ed1833f
		i32 30, ; uint32_t entry_count
		i32 19, ; uint32_t duplicate_count
		ptr @module16_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module16_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.16_assembly_name, ; assembly_name: Xamarin.Google.Crypto.Tink.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 16
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x65, i8 u0x50, i8 u0x74, i8 u0x8f, i8 u0xa2, i8 u0xfe, i8 u0x24, i8 u0x47, i8 u0xa7, i8 u0x38, i8 u0xb7, i8 u0x03, i8 u0x86, i8 u0x75, i8 u0xe4, i8 u0xf8 ], ; module_uuid: 8f745065-fea2-4724-a738-b7038675e4f8
		i32 108, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module17_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.17_assembly_name, ; assembly_name: Microsoft.Maui.Controls
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 17
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x67, i8 u0x5d, i8 u0xef, i8 u0xad, i8 u0x5b, i8 u0xd7, i8 u0xe4, i8 u0x41, i8 u0x96, i8 u0xe2, i8 u0x1b, i8 u0xe6, i8 u0x67, i8 u0xfb, i8 u0xfa, i8 u0x23 ], ; module_uuid: adef5d67-d75b-41e4-96e2-1be667fbfa23
		i32 55, ; uint32_t entry_count
		i32 19, ; uint32_t duplicate_count
		ptr @module18_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module18_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.18_assembly_name, ; assembly_name: Xamarin.AndroidX.AppCompat
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 18
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x69, i8 u0x81, i8 u0xdc, i8 u0xec, i8 u0x75, i8 u0x7d, i8 u0x97, i8 u0x4c, i8 u0xbc, i8 u0x52, i8 u0x5a, i8 u0x35, i8 u0xd4, i8 u0x95, i8 u0x0d, i8 u0x4b ], ; module_uuid: ecdc8169-7d75-4c97-bc52-5a35d4950d4b
		i32 2, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module19_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.19_assembly_name, ; assembly_name: teamup_mmu
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 19
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x71, i8 u0x8e, i8 u0xfd, i8 u0x41, i8 u0xe8, i8 u0x30, i8 u0xb6, i8 u0x44, i8 u0x95, i8 u0x98, i8 u0xfd, i8 u0x90, i8 u0x65, i8 u0x11, i8 u0x58, i8 u0x92 ], ; module_uuid: 41fd8e71-30e8-44b6-9598-fd9065115892
		i32 7, ; uint32_t entry_count
		i32 4, ; uint32_t duplicate_count
		ptr @module20_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module20_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.20_assembly_name, ; assembly_name: Xamarin.AndroidX.ViewPager
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 20
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x72, i8 u0x26, i8 u0x6a, i8 u0x71, i8 u0x33, i8 u0x57, i8 u0x82, i8 u0x4a, i8 u0x8b, i8 u0x06, i8 u0xce, i8 u0xda, i8 u0x61, i8 u0x46, i8 u0x8f, i8 u0xb1 ], ; module_uuid: 716a2672-5733-4a82-8b06-ceda61468fb1
		i32 9, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module21_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.21_assembly_name, ; assembly_name: Microsoft.Maui.Essentials
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 21
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x80, i8 u0xcd, i8 u0x7f, i8 u0x0e, i8 u0x04, i8 u0xf5, i8 u0xfb, i8 u0x49, i8 u0x8c, i8 u0xaa, i8 u0xbc, i8 u0x95, i8 u0x5e, i8 u0x97, i8 u0xe3, i8 u0x6a ], ; module_uuid: 0e7fcd80-f504-49fb-8caa-bc955e97e36a
		i32 3, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module22_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module22_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.22_assembly_name, ; assembly_name: Xamarin.AndroidX.CoordinatorLayout
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 22
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x9a, i8 u0x5c, i8 u0x47, i8 u0x24, i8 u0x30, i8 u0x54, i8 u0x23, i8 u0x4a, i8 u0x91, i8 u0x3a, i8 u0x55, i8 u0x61, i8 u0xe5, i8 u0xd7, i8 u0xa6, i8 u0x65 ], ; module_uuid: 24475c9a-5430-4a23-913a-5561e5d7a665
		i32 6, ; uint32_t entry_count
		i32 3, ; uint32_t duplicate_count
		ptr @module23_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module23_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.23_assembly_name, ; assembly_name: Xamarin.AndroidX.Lifecycle.Common.Jvm
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 23
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x9c, i8 u0x27, i8 u0x9b, i8 u0x1f, i8 u0x69, i8 u0x6d, i8 u0x8c, i8 u0x4e, i8 u0xb5, i8 u0x5c, i8 u0x9f, i8 u0x1c, i8 u0x43, i8 u0xf8, i8 u0xd6, i8 u0xf6 ], ; module_uuid: 1f9b279c-6d69-4e8c-b55c-9f1c43f8d6f6
		i32 7, ; uint32_t entry_count
		i32 7, ; uint32_t duplicate_count
		ptr @module24_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module24_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.24_assembly_name, ; assembly_name: Xamarin.KotlinX.Coroutines.Core.Jvm
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 24
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0x9c, i8 u0x5c, i8 u0x15, i8 u0xd8, i8 u0xe9, i8 u0x53, i8 u0x62, i8 u0x40, i8 u0x8e, i8 u0x17, i8 u0x52, i8 u0x3c, i8 u0x76, i8 u0x50, i8 u0x7c, i8 u0x77 ], ; module_uuid: d8155c9c-53e9-4062-8e17-523c76507c77
		i32 10, ; uint32_t entry_count
		i32 9, ; uint32_t duplicate_count
		ptr @module25_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module25_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.25_assembly_name, ; assembly_name: Xamarin.KotlinX.Serialization.Core.Jvm
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 25
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xa0, i8 u0xcc, i8 u0xc3, i8 u0xbc, i8 u0xb0, i8 u0x12, i8 u0x93, i8 u0x4e, i8 u0xb8, i8 u0xce, i8 u0x11, i8 u0x69, i8 u0xe5, i8 u0x8a, i8 u0x02, i8 u0x5c ], ; module_uuid: bcc3cca0-12b0-4e93-b8ce-1169e58a025c
		i32 6, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module26_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.26_assembly_name, ; assembly_name: Xamarin.AndroidX.Security.SecurityCrypto
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 26
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xa2, i8 u0x84, i8 u0x88, i8 u0x87, i8 u0x4e, i8 u0x31, i8 u0xec, i8 u0x44, i8 u0xa8, i8 u0xac, i8 u0xed, i8 u0xb7, i8 u0xfa, i8 u0x2e, i8 u0x4f, i8 u0x6d ], ; module_uuid: 878884a2-314e-44ec-a8ac-edb7fa2e4f6d
		i32 1, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module27_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.27_assembly_name, ; assembly_name: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 27
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xa2, i8 u0xa8, i8 u0x3f, i8 u0x22, i8 u0xa1, i8 u0xcf, i8 u0x8b, i8 u0x4f, i8 u0xb7, i8 u0x69, i8 u0x54, i8 u0xcf, i8 u0x73, i8 u0xb0, i8 u0x25, i8 u0x11 ], ; module_uuid: 223fa8a2-cfa1-4f8b-b769-54cf73b02511
		i32 1, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module28_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.28_assembly_name, ; assembly_name: Xamarin.AndroidX.Collection.Jvm
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 28
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xa5, i8 u0x20, i8 u0xd8, i8 u0x22, i8 u0xaf, i8 u0xde, i8 u0x73, i8 u0x4b, i8 u0x82, i8 u0x37, i8 u0x04, i8 u0x33, i8 u0x74, i8 u0x0d, i8 u0x76, i8 u0x7e ], ; module_uuid: 22d820a5-deaf-4b73-8237-0433740d767e
		i32 41, ; uint32_t entry_count
		i32 21, ; uint32_t duplicate_count
		ptr @module29_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module29_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.29_assembly_name, ; assembly_name: Xamarin.AndroidX.RecyclerView
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 29
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xa6, i8 u0x08, i8 u0xce, i8 u0x37, i8 u0x9f, i8 u0xa4, i8 u0x4c, i8 u0x45, i8 u0x9b, i8 u0x8b, i8 u0x8f, i8 u0xcf, i8 u0x2c, i8 u0x01, i8 u0xc1, i8 u0x37 ], ; module_uuid: 37ce08a6-a49f-454c-9b8b-8fcf2c01c137
		i32 20, ; uint32_t entry_count
		i32 10, ; uint32_t duplicate_count
		ptr @module30_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module30_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.30_assembly_name, ; assembly_name: Xamarin.AndroidX.Fragment
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 30
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xb2, i8 u0x48, i8 u0x7d, i8 u0x84, i8 u0x86, i8 u0xd9, i8 u0xc0, i8 u0x48, i8 u0xb2, i8 u0xcf, i8 u0xa7, i8 u0x57, i8 u0x6a, i8 u0xd2, i8 u0xdd, i8 u0x2a ], ; module_uuid: 847d48b2-d986-48c0-b2cf-a7576ad2dd2a
		i32 500, ; uint32_t entry_count
		i32 205, ; uint32_t duplicate_count
		ptr @module31_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module31_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.31_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 31
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xca, i8 u0x03, i8 u0xe6, i8 u0xb1, i8 u0xa0, i8 u0x40, i8 u0x80, i8 u0x4f, i8 u0x9f, i8 u0xcd, i8 u0xa2, i8 u0xcf, i8 u0xcd, i8 u0x63, i8 u0xe1, i8 u0x8d ], ; module_uuid: b1e603ca-40a0-4f80-9fcd-a2cfcd63e18d
		i32 2, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module32_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module32_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.32_assembly_name, ; assembly_name: Xamarin.AndroidX.SavedState.SavedState.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 32
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xce, i8 u0x54, i8 u0xa5, i8 u0xd1, i8 u0xd5, i8 u0x7b, i8 u0x9d, i8 u0x47, i8 u0xb4, i8 u0x0b, i8 u0x7f, i8 u0x8d, i8 u0x8b, i8 u0xe4, i8 u0x4a, i8 u0x8c ], ; module_uuid: d1a554ce-7bd5-479d-b40b-7f8d8be44a8c
		i32 2, ; uint32_t entry_count
		i32 0, ; uint32_t duplicate_count
		ptr @module33_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.33_assembly_name, ; assembly_name: Xamarin.AndroidX.AppCompat.AppCompatResources
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 33
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xdd, i8 u0x02, i8 u0xe3, i8 u0xe6, i8 u0x21, i8 u0xff, i8 u0x4d, i8 u0x44, i8 u0x97, i8 u0xfd, i8 u0x3a, i8 u0x22, i8 u0x81, i8 u0x55, i8 u0x0f, i8 u0xf1 ], ; module_uuid: e6e302dd-ff21-444d-97fd-3a2281550ff1
		i32 24, ; uint32_t entry_count
		i32 19, ; uint32_t duplicate_count
		ptr @module34_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module34_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.34_assembly_name, ; assembly_name: Xamarin.Kotlin.StdLib
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 34
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xe1, i8 u0x31, i8 u0x18, i8 u0x91, i8 u0xe1, i8 u0x34, i8 u0x00, i8 u0x41, i8 u0x80, i8 u0xb3, i8 u0xcc, i8 u0xbd, i8 u0x33, i8 u0x0c, i8 u0xf7, i8 u0xa9 ], ; module_uuid: 911831e1-34e1-4100-80b3-ccbd330cf7a9
		i32 7, ; uint32_t entry_count
		i32 5, ; uint32_t duplicate_count
		ptr @module35_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module35_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.35_assembly_name, ; assembly_name: Xamarin.AndroidX.ViewPager2
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 35
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xe9, i8 u0xba, i8 u0x2d, i8 u0xca, i8 u0xbd, i8 u0x4d, i8 u0x04, i8 u0x4c, i8 u0xa3, i8 u0x6d, i8 u0x2b, i8 u0x89, i8 u0xfe, i8 u0xed, i8 u0x44, i8 u0x61 ], ; module_uuid: ca2dbae9-4dbd-4c04-a36d-2b89feed4461
		i32 4, ; uint32_t entry_count
		i32 1, ; uint32_t duplicate_count
		ptr @module36_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module36_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.36_assembly_name, ; assembly_name: Xamarin.AndroidX.DrawerLayout
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	}, ; 36
	%struct.TypeMapModule {
		[16 x i8] [ i8 u0xfb, i8 u0xac, i8 u0x86, i8 u0xd1, i8 u0x6b, i8 u0xb5, i8 u0x39, i8 u0x46, i8 u0x9a, i8 u0xef, i8 u0x55, i8 u0xb7, i8 u0xb9, i8 u0x0a, i8 u0xc7, i8 u0xcb ], ; module_uuid: d186acfb-b56b-4639-9aef-55b7b90ac7cb
		i32 14, ; uint32_t entry_count
		i32 2, ; uint32_t duplicate_count
		ptr @module37_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module37_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.37_assembly_name, ; assembly_name: Java.Interop
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width
		ptr null; uint8_t* java_map
	} ; 37
], align 4

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [1150 x i32] [
	i32 u0x00478dcb, ; 0 => android/animation/Animator$AnimatorListener
	i32 u0x004cab3f, ; 1 => crc6452ffdc5b34af3a0f/MauiSwipeView
	i32 u0x00bc506a, ; 2 => java/lang/Object
	i32 u0x00bedaaf, ; 3 => java/lang/AutoCloseable
	i32 u0x00c42a04, ; 4 => android/text/style/LineHeightSpan
	i32 u0x00e478f9, ; 5 => androidx/recyclerview/widget/LinearLayoutManager
	i32 u0x00fb0a3a, ; 6 => kotlin/reflect/KParameter
	i32 u0x010e2046, ; 7 => androidx/fragment/app/Fragment
	i32 u0x01c47bce, ; 8 => android/widget/ListAdapter
	i32 u0x01e7a30c, ; 9 => androidx/lifecycle/AtomicReference
	i32 u0x01e97a1e, ; 10 => java/security/cert/Certificate
	i32 u0x02088ffa, ; 11 => android/content/pm/PackageItemInfo
	i32 u0x02142dda, ; 12 => android/webkit/WebResourceResponse
	i32 u0x023d7f57, ; 13 => kotlin/reflect/KTypeProjection$Companion
	i32 u0x026bf8c9, ; 14 => mono/androidx/appcompat/widget/SearchView_OnCloseListenerImplementor
	i32 u0x02d3cbcb, ; 15 => mono/androidx/swiperefreshlayout/widget/SwipeRefreshLayout_OnRefreshListenerImplementor
	i32 u0x0330909f, ; 16 => com/google/crypto/tink/shaded/protobuf/MessageLite$Builder
	i32 u0x04197fb0, ; 17 => crc6452ffdc5b34af3a0f/ScopedFragment
	i32 u0x042a7d13, ; 18 => androidx/core/view/WindowInsetsCompat
	i32 u0x046d7780, ; 19 => android/view/ViewGroup
	i32 u0x04f92ecb, ; 20 => androidx/recyclerview/widget/RecyclerView$OnItemTouchListener
	i32 u0x053f6aee, ; 21 => com/google/crypto/tink/shaded/protobuf/CodedInputStream
	i32 u0x0545fbb5, ; 22 => com/google/android/material/shape/ShapeAppearanceModel$Builder
	i32 u0x05672010, ; 23 => java/io/FileNotFoundException
	i32 u0x0607f599, ; 24 => mono/android/app/DatePickerDialog_OnDateSetListenerImplementor
	i32 u0x0618dae1, ; 25 => androidx/appcompat/widget/DecorToolbar
	i32 u0x066694a3, ; 26 => androidx/navigation/NavigatorProvider
	i32 u0x068a5e08, ; 27 => android/view/autofill/AutofillId
	i32 u0x06e147bf, ; 28 => net/dot/jni/ManagedPeer
	i32 u0x06f9f7e2, ; 29 => android/graphics/BlurMaskFilter
	i32 u0x0717724f, ; 30 => android/util/DisplayMetrics
	i32 u0x0720f4c1, ; 31 => com/google/android/material/shape/ShapeAppearanceModel$CornerSizeUnaryOperator
	i32 u0x079ef0ee, ; 32 => androidx/fragment/app/strictmode/FragmentStrictMode$Policy
	i32 u0x07b07a2a, ; 33 => android/graphics/PorterDuffXfermode
	i32 u0x07d492c1, ; 34 => android/webkit/RenderProcessGoneDetail
	i32 u0x07d910b4, ; 35 => crc6488302ad6e9e4df1a/ImageLoaderCallback
	i32 u0x07eec85c, ; 36 => androidx/activity/OnBackPressedCallback
	i32 u0x082b9f40, ; 37 => androidx/activity/result/contract/ActivityResultContracts
	i32 u0x0833f622, ; 38 => crc640ec207abc449b2ca/ShellSectionRenderer_ViewPagerPageChanged
	i32 u0x083c5433, ; 39 => javax/net/ssl/SSLSessionContext
	i32 u0x084d3fe5, ; 40 => android/view/KeyEvent
	i32 u0x0895b1f6, ; 41 => android/text/style/SubscriptSpan
	i32 u0x08b214f7, ; 42 => java/util/List
	i32 u0x08da0411, ; 43 => android/text/GetChars
	i32 u0x08eb4f47, ; 44 => crc64338477404e88479c/MultiPageFragmentStateAdapter_1
	i32 u0x08f9beb5, ; 45 => androidx/activity/contextaware/OnContextAvailableListener
	i32 u0x095e0c49, ; 46 => crc649ff77a65592e7d55/TabbedPageManager_Listeners
	i32 u0x096ec55d, ; 47 => mono/androidx/fragment/app/FragmentManager_OnBackStackChangedListenerImplementor
	i32 u0x0981856f, ; 48 => androidx/activity/result/contract/ActivityResultContract
	i32 u0x099c8922, ; 49 => com/google/crypto/tink/shaded/protobuf/Internal$DoubleList
	i32 u0x09b71dad, ; 50 => crc645d80431ce5f73f11/StartSnapHelper
	i32 u0x09e8221d, ; 51 => java/text/DecimalFormat
	i32 u0x09e90572, ; 52 => mono/com/google/android/material/button/MaterialButton_OnCheckedChangeListenerImplementor
	i32 u0x09f32486, ; 53 => crc6452ffdc5b34af3a0f/ContainerView
	i32 u0x0a8831f3, ; 54 => java/lang/IllegalArgumentException
	i32 u0x0aa158cb, ; 55 => android/window/OnBackInvokedCallback
	i32 u0x0aeaaae8, ; 56 => android/view/OrientationEventListener
	i32 u0x0b7ed74c, ; 57 => com/google/android/material/button/MaterialButton$OnCheckedChangeListener
	i32 u0x0b81b467, ; 58 => kotlinx/serialization/encoding/Encoder
	i32 u0x0b9203de, ; 59 => crc649ff77a65592e7d55/TabbedPageManager_TempView
	i32 u0x0bb64482, ; 60 => androidx/viewpager2/adapter/FragmentStateAdapter$FragmentTransactionCallback$OnPostEventListener
	i32 u0x0c92ff5a, ; 61 => [Ljava/lang/Object;
	i32 u0x0d5716c4, ; 62 => com/microsoft/maui/PlatformInterop
	i32 u0x0d7ee84f, ; 63 => androidx/navigation/NavDeepLink
	i32 u0x0d8e6b2b, ; 64 => com/google/crypto/tink/shaded/protobuf/UnknownFieldSetLite
	i32 u0x0db97f4c, ; 65 => crc64e1fb321c08285b90/ListViewRenderer
	i32 u0x0dfa53b7, ; 66 => com/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior
	i32 u0x0e019f53, ; 67 => androidx/lifecycle/MutableLiveData
	i32 u0x0ee7af87, ; 68 => androidx/navigation/NavHostController
	i32 u0x0f00221f, ; 69 => android/widget/DatePicker
	i32 u0x0f1f3e6c, ; 70 => android/graphics/RadialGradient
	i32 u0x0f52f1a6, ; 71 => java/lang/ReflectiveOperationException
	i32 u0x0f56401e, ; 72 => androidx/navigation/Navigator
	i32 u0x0f62955c, ; 73 => android/webkit/WebChromeClient$CustomViewCallback
	i32 u0x0fab0d1d, ; 74 => android/view/WindowInsets
	i32 u0x100ba9c7, ; 75 => javax/security/cert/X509Certificate
	i32 u0x103d4ae1, ; 76 => android/window/TrustedPresentationThresholds
	i32 u0x103d95e0, ; 77 => crc64e1fb321c08285b90/ViewRenderer_2
	i32 u0x10714b0d, ; 78 => com/google/android/material/appbar/AppBarLayout$LayoutParams
	i32 u0x1079b5f8, ; 79 => java/security/spec/EncodedKeySpec
	i32 u0x10910a74, ; 80 => android/view/ViewGroup$OnHierarchyChangeListener
	i32 u0x1093a286, ; 81 => crc64e1fb321c08285b90/EntryCellView
	i32 u0x10abc779, ; 82 => android/content/SharedPreferences$Editor
	i32 u0x10c1a907, ; 83 => java/util/function/Function
	i32 u0x111682ad, ; 84 => crc645d80431ce5f73f11/PositionalSmoothScroller
	i32 u0x1175c4c3, ; 85 => androidx/loader/content/Loader$OnLoadCompleteListener
	i32 u0x1180e1f5, ; 86 => crc6452ffdc5b34af3a0f/MauiShapeView
	i32 u0x11a20c22, ; 87 => crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer
	i32 u0x11c94630, ; 88 => mono/androidx/viewpager/widget/ViewPager_OnAdapterChangeListenerImplementor
	i32 u0x11d7c927, ; 89 => androidx/savedstate/SavedStateRegistry
	i32 u0x1232d570, ; 90 => crc64e1fb321c08285b90/CellRenderer_RendererHolder
	i32 u0x124d2e7b, ; 91 => android/view/MenuItem$OnActionExpandListener
	i32 u0x12d4d672, ; 92 => androidx/core/view/WindowCompat
	i32 u0x12e718cb, ; 93 => android/animation/Animator
	i32 u0x13321490, ; 94 => com/google/crypto/tink/shaded/protobuf/Internal$FloatList
	i32 u0x1431beb7, ; 95 => com/google/android/material/appbar/CollapsingToolbarLayout
	i32 u0x1436ed86, ; 96 => androidx/security/crypto/MasterKey$KeyScheme
	i32 u0x14799e8f, ; 97 => android/widget/AbsListView$OnScrollListener
	i32 u0x14e363b0, ; 98 => javax/crypto/BadPaddingException
	i32 u0x155ae8e9, ; 99 => android/text/style/CharacterStyle
	i32 u0x157cf77b, ; 100 => androidx/appcompat/widget/AppCompatRadioButton
	i32 u0x15d8dfc9, ; 101 => android/view/ViewGroup$LayoutParams
	i32 u0x15f16189, ; 102 => [D
	i32 u0x1637fef4, ; 103 => crc6488302ad6e9e4df1a/ImageLoaderCallbackBase_1
	i32 u0x1749241e, ; 104 => crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer_HeaderContainer
	i32 u0x17725ef2, ; 105 => mono/java/lang/RunnableImplementor
	i32 u0x17a32db8, ; 106 => androidx/lifecycle/LifecycleOwner
	i32 u0x17b23958, ; 107 => crc6452ffdc5b34af3a0f/MauiHybridWebView
	i32 u0x17cdcfdb, ; 108 => android/animation/TimeInterpolator
	i32 u0x189a6365, ; 109 => java/lang/Long
	i32 u0x18d6d687, ; 110 => android/util/StateSet
	i32 u0x18e22b17, ; 111 => kotlin/sequences/Sequence
	i32 u0x18feeb05, ; 112 => java/util/Iterator
	i32 u0x19100f08, ; 113 => java/net/ConnectException
	i32 u0x193579d8, ; 114 => androidx/recyclerview/widget/RecyclerViewAccessibilityDelegate
	i32 u0x194bb4e9, ; 115 => java/lang/ClassLoader
	i32 u0x195ae333, ; 116 => mono/androidx/navigation/NavController_OnDestinationChangedListenerImplementor
	i32 u0x198045ff, ; 117 => androidx/fragment/app/FragmentResultListener
	i32 u0x19ecef57, ; 118 => android/runtime/XmlReaderPullParser
	i32 u0x1a0b1639, ; 119 => android/content/DialogInterface$OnShowListener
	i32 u0x1a163acf, ; 120 => android/app/UiModeManager
	i32 u0x1a53a322, ; 121 => androidx/fragment/app/FragmentFactory
	i32 u0x1a549103, ; 122 => androidx/appcompat/widget/ScrollingTabContainerView$VisibilityAnimListener
	i32 u0x1a6b349b, ; 123 => java/lang/LinkageError
	i32 u0x1a8f0c05, ; 124 => androidx/recyclerview/widget/RecyclerView$AdapterDataObserver
	i32 u0x1ad1b5c7, ; 125 => androidx/recyclerview/widget/OrientationHelper
	i32 u0x1b04fce5, ; 126 => com/google/crypto/tink/shaded/protobuf/Internal$ProtobufList
	i32 u0x1b4e378e, ; 127 => crc6452ffdc5b34af3a0f/MauiPicker
	i32 u0x1b9e9991, ; 128 => com/google/android/material/navigation/NavigationBarView$OnItemReselectedListener
	i32 u0x1baaf41a, ; 129 => crc6452ffdc5b34af3a0f/MauiStepper
	i32 u0x1cdb4833, ; 130 => androidx/recyclerview/widget/RecyclerView$LayoutManager
	i32 u0x1d3e444f, ; 131 => java/util/concurrent/TimeUnit
	i32 u0x1d402962, ; 132 => crc645d80431ce5f73f11/NongreedySnapHelper
	i32 u0x1d993a8a, ; 133 => crc64e1fb321c08285b90/ListViewRenderer_ListViewScrollDetector
	i32 u0x1de7d866, ; 134 => android/view/ViewGroup$MarginLayoutParams
	i32 u0x1e91847a, ; 135 => crc64e1fb321c08285b90/FrameRenderer
	i32 u0x1ecf6a19, ; 136 => com/google/crypto/tink/shaded/protobuf/WireFormat$FieldType
	i32 u0x1ed12fb6, ; 137 => android/view/ViewParent
	i32 u0x1ed7c45a, ; 138 => androidx/recyclerview/widget/RecyclerView$ViewHolder
	i32 u0x1edafe2e, ; 139 => android/os/Parcel
	i32 u0x1f153e95, ; 140 => androidx/lifecycle/ViewModelProvider$Factory$Companion
	i32 u0x1f35371e, ; 141 => android/app/SearchableInfo
	i32 u0x1fa9731c, ; 142 => mono/android/runtime/OutputStreamAdapter
	i32 u0x1fd388b2, ; 143 => com/microsoft/maui/PlatformViewGroup
	i32 u0x2012da5e, ; 144 => crc64ba438d8f48cf7e75/IntermediateActivity
	i32 u0x2103ec5f, ; 145 => android/graphics/drawable/ColorDrawable
	i32 u0x2109685b, ; 146 => java/util/function/UnaryOperator
	i32 u0x210f5079, ; 147 => android/opengl/Matrix
	i32 u0x21709a11, ; 148 => [S
	i32 u0x21e20b74, ; 149 => android/content/DialogInterface$OnDismissListener
	i32 u0x220dab84, ; 150 => android/widget/SectionIndexer
	i32 u0x2222aa0b, ; 151 => crc64e1fb321c08285b90/GroupedListViewAdapter
	i32 u0x2247788b, ; 152 => kotlin/reflect/KClassifier
	i32 u0x22a2d798, ; 153 => java/nio/channels/FileChannel
	i32 u0x22b53691, ; 154 => crc6452ffdc5b34af3a0f/PlatformTouchGraphicsView
	i32 u0x22d234ef, ; 155 => android/widget/Filter
	i32 u0x22d2aa9f, ; 156 => java/lang/IllegalStateException
	i32 u0x22d50cad, ; 157 => com/google/android/material/shape/MaterialShapeDrawable
	i32 u0x22e5821a, ; 158 => androidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener
	i32 u0x22ffb172, ; 159 => androidx/activity/ComponentActivity
	i32 u0x233014cf, ; 160 => [B
	i32 u0x233568be, ; 161 => android/view/ViewTreeObserver
	i32 u0x23380852, ; 162 => crc645d80431ce5f73f11/StartSingleSnapHelper
	i32 u0x23464fac, ; 163 => android/os/Bundle
	i32 u0x2368da71, ; 164 => crc64338477404e88479c/ModalNavigationManager_ModalFragment_CustomComponentDialog
	i32 u0x23952c7c, ; 165 => crc64338477404e88479c/ColorChangeRevealDrawable
	i32 u0x23e6e7ee, ; 166 => java/security/spec/PKCS8EncodedKeySpec
	i32 u0x242020ac, ; 167 => java/io/Serializable
	i32 u0x2433ab5e, ; 168 => android/view/animation/LinearInterpolator
	i32 u0x245fc51f, ; 169 => androidx/core/view/accessibility/AccessibilityViewCommand
	i32 u0x24c03bd9, ; 170 => mono/androidx/recyclerview/widget/RecyclerView_RecyclerListenerImplementor
	i32 u0x24d523fa, ; 171 => androidx/appcompat/app/ActionBar$OnNavigationListener
	i32 u0x24e61bfb, ; 172 => java/net/URL
	i32 u0x250e8d70, ; 173 => crc6452ffdc5b34af3a0f/MauiSearchView
	i32 u0x251064b7, ; 174 => crc64338477404e88479c/GenericMenuClickListener
	i32 u0x25380d4a, ; 175 => android/view/View$DragShadowBuilder
	i32 u0x254d9be0, ; 176 => androidx/appcompat/app/AppCompatActivity
	i32 u0x2592f163, ; 177 => android/text/method/KeyListener
	i32 u0x25acea43, ; 178 => android/app/TimePickerDialog
	i32 u0x25f292d5, ; 179 => com/google/android/material/internal/ScrimInsetsFrameLayout
	i32 u0x260ef71f, ; 180 => androidx/recyclerview/widget/RecyclerView$ViewCacheExtension
	i32 u0x26120c9e, ; 181 => android/view/GestureDetector$OnGestureListener
	i32 u0x2662c089, ; 182 => androidx/fragment/app/FragmentContainer
	i32 u0x267564e8, ; 183 => androidx/loader/content/Loader
	i32 u0x2711b991, ; 184 => crc64fcf28c0e24b4cc31/SwitchHandler_CheckedChangeListener
	i32 u0x27174791, ; 185 => androidx/fragment/app/FragmentTransaction
	i32 u0x2733a797, ; 186 => androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener
	i32 u0x291921cf, ; 187 => androidx/appcompat/widget/Toolbar
	i32 u0x2920644b, ; 188 => androidx/core/view/OnApplyWindowInsetsListener
	i32 u0x2927a467, ; 189 => com/google/crypto/tink/shaded/protobuf/MessageLiteOrBuilder
	i32 u0x294d1f6f, ; 190 => java/util/ArrayList
	i32 u0x29519679, ; 191 => crc64a096dc44ad241142/PlatformTicker_DurationScaleListener
	i32 u0x29c7fa0b, ; 192 => mono/androidx/core/widget/NestedScrollView_OnScrollChangeListenerImplementor
	i32 u0x29da15f0, ; 193 => android/graphics/drawable/GradientDrawable$Orientation
	i32 u0x2a7040b6, ; 194 => crc645d80431ce5f73f11/ItemsViewAdapter_2
	i32 u0x2b245eed, ; 195 => crc645d80431ce5f73f11/CenterSnapHelper
	i32 u0x2beb7623, ; 196 => androidx/appcompat/widget/SearchView
	i32 u0x2c1b9c3b, ; 197 => androidx/core/text/PrecomputedTextCompat
	i32 u0x2c59949b, ; 198 => android/graphics/Paint$Join
	i32 u0x2c73cf3e, ; 199 => android/text/style/SuperscriptSpan
	i32 u0x2d74d41b, ; 200 => com/google/android/material/shape/ShapePathModel
	i32 u0x2d894828, ; 201 => com/microsoft/maui/PlatformFontSpan
	i32 u0x2e0eb4ab, ; 202 => mono/com/google/android/material/checkbox/MaterialCheckBox_OnCheckedStateChangedListenerImplementor
	i32 u0x2e841628, ; 203 => java/lang/CharSequence
	i32 u0x2e8cec9f, ; 204 => java/io/PrintWriter
	i32 u0x2edea1d2, ; 205 => android/graphics/drawable/PaintDrawable
	i32 u0x2ef62f80, ; 206 => mono/androidx/appcompat/widget/SearchView_OnQueryTextListenerImplementor
	i32 u0x2f030501, ; 207 => crc645d80431ce5f73f11/StructuredItemsViewAdapter_2
	i32 u0x2f523ac2, ; 208 => java/lang/Integer
	i32 u0x2f9d3744, ; 209 => androidx/core/view/WindowInsetsAnimationCompat$Callback
	i32 u0x3002ef83, ; 210 => android/os/IBinder$DeathRecipient
	i32 u0x3016caa7, ; 211 => java/lang/Thread
	i32 u0x30181324, ; 212 => java/text/DecimalFormatSymbols
	i32 u0x3047a991, ; 213 => android/animation/ValueAnimator$DurationScaleChangeListener
	i32 u0x30941ba0, ; 214 => androidx/core/internal/view/SupportMenuItem
	i32 u0x311d1bcb, ; 215 => androidx/appcompat/graphics/drawable/DrawerArrowDrawable
	i32 u0x316f39f7, ; 216 => crc6452ffdc5b34af3a0f/NavigationRootManager_ElementBasedFragment
	i32 u0x317411c3, ; 217 => androidx/core/widget/CompoundButtonCompat
	i32 u0x31ee71a1, ; 218 => kotlinx/serialization/DeserializationStrategy
	i32 u0x31fd4970, ; 219 => java/lang/NullPointerException
	i32 u0x32b6fa26, ; 220 => crc6452ffdc5b34af3a0f/LayoutViewGroup
	i32 u0x331bc629, ; 221 => android/content/res/AssetManager
	i32 u0x335d7ffc, ; 222 => com/google/android/material/navigation/NavigationBarItemView
	i32 u0x338d1039, ; 223 => android/graphics/Bitmap$Config
	i32 u0x33be7eb5, ; 224 => mono/android/app/TimePickerDialog_OnTimeSetListenerImplementor
	i32 u0x34408f1d, ; 225 => javax/net/ssl/TrustManager
	i32 u0x34c36fc5, ; 226 => android/content/ContentResolver
	i32 u0x353fa59a, ; 227 => java/lang/Short
	i32 u0x355cc90a, ; 228 => crc645d80431ce5f73f11/GridLayoutSpanSizeLookup
	i32 u0x359cf2e1, ; 229 => androidx/core/content/FileProvider
	i32 u0x359e1122, ; 230 => mono/androidx/core/view/ActionProvider_VisibilityListenerImplementor
	i32 u0x3600fc04, ; 231 => android/database/Cursor
	i32 u0x3616c5d8, ; 232 => androidx/navigation/ui/NavigationUI
	i32 u0x369b72ab, ; 233 => androidx/core/view/autofill/AutofillIdCompat
	i32 u0x36c8dd60, ; 234 => crc64338477404e88479c/DragAndDropGestureHandler
	i32 u0x36c9b6ff, ; 235 => mono/androidx/recyclerview/widget/RecyclerView_OnChildAttachStateChangeListenerImplementor
	i32 u0x3727d6cf, ; 236 => java/nio/ByteBuffer
	i32 u0x375a7458, ; 237 => android/graphics/BitmapFactory
	i32 u0x37c197fc, ; 238 => androidx/viewpager/widget/ViewPager$PageTransformer
	i32 u0x37e62d09, ; 239 => androidx/core/view/ViewPropertyAnimatorCompat
	i32 u0x37e734c2, ; 240 => com/google/android/material/navigation/NavigationBarPresenter
	i32 u0x3830cc82, ; 241 => crc6452ffdc5b34af3a0f/MauiWebChromeClient
	i32 u0x38d7ff82, ; 242 => androidx/recyclerview/widget/RecyclerView$LayoutManager$LayoutPrefetchRegistry
	i32 u0x395f2485, ; 243 => kotlinx/coroutines/flow/StateFlow
	i32 u0x39815ca6, ; 244 => android/text/TextUtils
	i32 u0x39877573, ; 245 => com/microsoft/maui/PlatformPaintType
	i32 u0x39a5d9ef, ; 246 => android/text/TextPaint
	i32 u0x3a096e32, ; 247 => com/google/android/material/appbar/CollapsingToolbarLayout$StaticLayoutBuilderConfigurer
	i32 u0x3a48f956, ; 248 => androidx/appcompat/app/ActionBarDrawerToggle$Delegate
	i32 u0x3a7f1f33, ; 249 => crc64338477404e88479c/GradientStrokeDrawable
	i32 u0x3a8d1ecd, ; 250 => android/widget/HorizontalScrollView
	i32 u0x3a91c58d, ; 251 => androidx/lifecycle/LiveData
	i32 u0x3aafe3b4, ; 252 => android/graphics/PointF
	i32 u0x3ab236a7, ; 253 => androidx/appcompat/app/AlertDialog_IDialogInterfaceOnCancelListenerImplementor
	i32 u0x3ac61340, ; 254 => androidx/core/content/ContextCompat
	i32 u0x3af26c4d, ; 255 => android/text/method/BaseKeyListener
	i32 u0x3b686dd0, ; 256 => java/io/FileDescriptor
	i32 u0x3b6aaeb6, ; 257 => androidx/lifecycle/Observer
	i32 u0x3bb02f49, ; 258 => com/microsoft/maui/PlatformLogger
	i32 u0x3c238b9c, ; 259 => android/graphics/Color
	i32 u0x3c676983, ; 260 => com/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState
	i32 u0x3c99c850, ; 261 => androidx/recyclerview/widget/ItemTouchHelper
	i32 u0x3cb98831, ; 262 => android/widget/EditText
	i32 u0x3cd9ecb2, ; 263 => androidx/drawerlayout/widget/DrawerLayout$LayoutParams
	i32 u0x3d2de4ff, ; 264 => android/view/WindowMetrics
	i32 u0x3d2f4240, ; 265 => java/net/SocketAddress
	i32 u0x3d3ecbec, ; 266 => net/dot/jni/internal/JavaProxyObject
	i32 u0x3d6f597a, ; 267 => android/database/DataSetObserver
	i32 u0x3dbfff89, ; 268 => android/content/res/Resources
	i32 u0x3df0d4a6, ; 269 => android/view/SurfaceControlInputReceiver
	i32 u0x3e5fd7cb, ; 270 => microsoft/maui/platform/MauiNavHostFragment
	i32 u0x3e607fe9, ; 271 => android/text/InputFilter$LengthFilter
	i32 u0x3e670d08, ; 272 => androidx/fragment/app/FragmentContainerView
	i32 u0x3e78485e, ; 273 => android/view/GestureDetector$OnDoubleTapListener
	i32 u0x3edd497a, ; 274 => android/graphics/drawable/shapes/OvalShape
	i32 u0x3eebda7e, ; 275 => android/widget/AbsoluteLayout
	i32 u0x3f290730, ; 276 => androidx/viewpager/widget/ViewPager
	i32 u0x3fa97b77, ; 277 => crc640ec207abc449b2ca/CustomFrameLayout
	i32 u0x3fcde9ae, ; 278 => android/database/ContentObserver
	i32 u0x3fce790c, ; 279 => androidx/navigation/NavDeepLinkBuilder
	i32 u0x3ff4ef52, ; 280 => java/lang/annotation/Annotation
	i32 u0x3fff4f83, ; 281 => mono/android/animation/ValueAnimator_AnimatorUpdateListenerImplementor
	i32 u0x40186e33, ; 282 => com/google/android/material/tabs/TabLayout$TabView
	i32 u0x403b5100, ; 283 => java/util/function/Consumer
	i32 u0x4082de07, ; 284 => androidx/recyclerview/widget/RecyclerView$ItemDecoration
	i32 u0x409cbcf3, ; 285 => androidx/core/view/OnReceiveContentListener
	i32 u0x4103dd30, ; 286 => androidx/navigation/NavController
	i32 u0x41066ac4, ; 287 => javax/net/ssl/KeyManagerFactory
	i32 u0x4124ee8a, ; 288 => crc64e1fb321c08285b90/ListViewRenderer_Container
	i32 u0x419f5f85, ; 289 => android/widget/TextView$OnEditorActionListener
	i32 u0x41aacf93, ; 290 => mono/com/google/android/material/navigation/NavigationView_OnNavigationItemSelectedListenerImplementor
	i32 u0x41aca669, ; 291 => mono/android/view/View_OnFocusChangeListenerImplementor
	i32 u0x41b8a68b, ; 292 => android/text/Layout$Alignment
	i32 u0x41fe3ee6, ; 293 => androidx/appcompat/app/ActionBar$OnMenuVisibilityListener
	i32 u0x41ffdec1, ; 294 => androidx/activity/result/ActivityResultLauncher
	i32 u0x421115f5, ; 295 => android/widget/AdapterView$OnItemLongClickListener
	i32 u0x4213ec86, ; 296 => microsoft/maui/essentials/fileProvider
	i32 u0x42994fe2, ; 297 => androidx/drawerlayout/widget/DrawerLayout
	i32 u0x4339cf56, ; 298 => androidx/navigation/ui/AppBarConfiguration
	i32 u0x439c42c4, ; 299 => androidx/core/view/ViewPropertyAnimatorListener
	i32 u0x43aa029b, ; 300 => kotlinx/coroutines/flow/MutableSharedFlow
	i32 u0x43f0e078, ; 301 => android/text/StaticLayout$Builder
	i32 u0x4411b6b5, ; 302 => java/util/Enumeration
	i32 u0x444226c8, ; 303 => crc640ec207abc449b2ca/ShellFragmentContainer
	i32 u0x44549b66, ; 304 => android/widget/RadioButton
	i32 u0x44722348, ; 305 => crc64338477404e88479c/PointerGestureHandler
	i32 u0x44806f44, ; 306 => java/lang/Cloneable
	i32 u0x4612c890, ; 307 => java/lang/ClassNotFoundException
	i32 u0x463d3a5b, ; 308 => com/google/android/material/bottomnavigation/BottomNavigationMenuView
	i32 u0x464a65f1, ; 309 => crc64e1fb321c08285b90/TableViewRenderer
	i32 u0x4663e7a6, ; 310 => crc64e1fb321c08285b90/ListViewRenderer_ListViewSwipeRefreshLayoutListener
	i32 u0x46649c28, ; 311 => androidx/appcompat/widget/AppCompatAutoCompleteTextView
	i32 u0x46869992, ; 312 => android/view/accessibility/AccessibilityNodeInfo$ExtraRenderingInfo
	i32 u0x46a5d765, ; 313 => android/view/SubMenu
	i32 u0x472f30ec, ; 314 => androidx/core/view/accessibility/AccessibilityWindowInfoCompat
	i32 u0x473360a9, ; 315 => crc640ec207abc449b2ca/ShellSearchView_ClipDrawableWrapper
	i32 u0x474a7a4e, ; 316 => java/lang/Appendable
	i32 u0x47706bb8, ; 317 => mono/com/google/android/material/tabs/TabLayout_BaseOnTabSelectedListenerImplementor
	i32 u0x47ac927d, ; 318 => android/text/style/StyleSpan
	i32 u0x47bec27c, ; 319 => kotlinx/serialization/descriptors/SerialDescriptor
	i32 u0x47d41efc, ; 320 => android/animation/ValueAnimator
	i32 u0x48481824, ; 321 => android/app/DatePickerDialog
	i32 u0x4850bb46, ; 322 => android/graphics/Xfermode
	i32 u0x48b62a0e, ; 323 => crc640ec207abc449b2ca/ShellFlyoutRenderer
	i32 u0x48b672c7, ; 324 => kotlin/enums/EnumEntries
	i32 u0x48cde81e, ; 325 => crc640ec207abc449b2ca/ShellSearchViewAdapter_ObjectWrapper
	i32 u0x48f94eac, ; 326 => crc640a8d9a12ddbf2cf2/EnergySaverBroadcastReceiver
	i32 u0x4923b010, ; 327 => javax/security/cert/Certificate
	i32 u0x49aa1d7f, ; 328 => androidx/core/view/contentcapture/ContentCaptureSessionCompat
	i32 u0x49b2d363, ; 329 => crc6488302ad6e9e4df1a/MauiAppCompatActivity_PredictiveBackCallback
	i32 u0x4a8f5c50, ; 330 => com/google/android/material/navigation/NavigationBarView$OnItemSelectedListener
	i32 u0x4abb3c6e, ; 331 => androidx/core/app/TaskStackBuilder
	i32 u0x4b02dd12, ; 332 => androidx/appcompat/view/ActionMode$Callback
	i32 u0x4b6bb0db, ; 333 => androidx/coordinatorlayout/widget/CoordinatorLayout
	i32 u0x4bb583ad, ; 334 => android/view/Window$Callback
	i32 u0x4bbb3aaa, ; 335 => java/net/SocketTimeoutException
	i32 u0x4c0869ac, ; 336 => androidx/navigation/ui/AppBarConfiguration$OnNavigateUpListener
	i32 u0x4c5b770c, ; 337 => android/widget/SeekBar$OnSeekBarChangeListener
	i32 u0x4cb4dca7, ; 338 => android/widget/Filter$FilterResults
	i32 u0x4cd44339, ; 339 => kotlin/jvm/functions/Function2
	i32 u0x4cde54af, ; 340 => crc6452ffdc5b34af3a0f/LocalizedDigitsKeyListener
	i32 u0x4d121556, ; 341 => com/google/android/material/appbar/HeaderBehavior
	i32 u0x4d64d6f9, ; 342 => java/lang/Throwable
	i32 u0x4d99a2d2, ; 343 => androidx/recyclerview/widget/RecyclerView$SmoothScroller
	i32 u0x4dc09619, ; 344 => androidx/core/view/MenuProvider
	i32 u0x4dda45b7, ; 345 => crc6488302ad6e9e4df1a/MauiApplication
	i32 u0x4dfe661e, ; 346 => crc64fcf28c0e24b4cc31/ButtonHandler_ButtonTouchListener
	i32 u0x4e614a2f, ; 347 => androidx/appcompat/app/AppCompatCallback
	i32 u0x4e907ef7, ; 348 => android/widget/Filterable
	i32 u0x4ee6065b, ; 349 => javax/net/ssl/SSLContext
	i32 u0x4f474993, ; 350 => androidx/recyclerview/widget/RecyclerView$RecycledViewPool
	i32 u0x4f6893c3, ; 351 => crc640ec207abc449b2ca/ScrollLayoutManager
	i32 u0x4f93fcd4, ; 352 => java/util/Collection
	i32 u0x4fa59f87, ; 353 => com/google/android/material/appbar/AppBarLayout$BaseBehavior$BaseDragCallback
	i32 u0x4faf2ae5, ; 354 => androidx/core/os/LocaleListCompat
	i32 u0x4fe415e2, ; 355 => android/graphics/Paint
	i32 u0x4fe7bef4, ; 356 => crc64fcf28c0e24b4cc31/HybridWebViewHandler_HybridWebViewJavaScriptInterface
	i32 u0x4ffeefbe, ; 357 => com/google/crypto/tink/shaded/protobuf/Internal$EnumLite
	i32 u0x502cf4aa, ; 358 => androidx/navigation/fragment/FragmentNavigator
	i32 u0x509bc3e1, ; 359 => androidx/appcompat/view/menu/MenuPresenter
	i32 u0x50aec99f, ; 360 => crc64e1fb321c08285b90/ListViewRenderer_SwipeRefreshLayoutWithFixedNestedScrolling
	i32 u0x50e42412, ; 361 => androidx/fragment/app/DialogFragment
	i32 u0x51378d59, ; 362 => androidx/appcompat/widget/Toolbar$LayoutParams
	i32 u0x51907546, ; 363 => java/lang/ClassCastException
	i32 u0x51b625d8, ; 364 => android/graphics/PorterDuff$Mode
	i32 u0x51deacb7, ; 365 => androidx/recyclerview/widget/RecyclerView$RecyclerListener
	i32 u0x51dff242, ; 366 => javax/net/ssl/KeyManager
	i32 u0x51f025eb, ; 367 => androidx/core/util/Pair
	i32 u0x527741c7, ; 368 => android/os/Message
	i32 u0x528b0ea0, ; 369 => androidx/lifecycle/SavedStateHandle
	i32 u0x52a83d46, ; 370 => android/content/ComponentName
	i32 u0x533e1761, ; 371 => mono/androidx/core/view/ActionProvider_SubUiVisibilityListenerImplementor
	i32 u0x5348d2f9, ; 372 => androidx/recyclerview/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener
	i32 u0x534e497b, ; 373 => crc640ec207abc449b2ca/ContainerView
	i32 u0x541e34e2, ; 374 => kotlinx/coroutines/flow/MutableStateFlow
	i32 u0x54661d07, ; 375 => android/content/pm/ApplicationInfo
	i32 u0x54b5a026, ; 376 => androidx/recyclerview/widget/RecyclerView$LayoutParams
	i32 u0x54fbd6e1, ; 377 => java/lang/SecurityException
	i32 u0x551e4b18, ; 378 => java/net/HttpURLConnection
	i32 u0x5538f851, ; 379 => android/graphics/RectF
	i32 u0x556abf7e, ; 380 => android/view/ViewManager
	i32 u0x55991f2d, ; 381 => crc645d80431ce5f73f11/RecyclerViewScrollListener_2
	i32 u0x55b8ed42, ; 382 => androidx/appcompat/view/menu/MenuView
	i32 u0x55c1c54b, ; 383 => android/view/View$OnAttachStateChangeListener
	i32 u0x55f87ea2, ; 384 => java/util/function/Predicate
	i32 u0x5606a26c, ; 385 => crc64ba438d8f48cf7e75/ActivityLifecycleContextListener
	i32 u0x56442f9e, ; 386 => android/widget/LinearLayout$LayoutParams
	i32 u0x568deecb, ; 387 => crc64338477404e88479c/TapAndPanGestureDetector
	i32 u0x56a1f2b6, ; 388 => com/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy
	i32 u0x56dcd081, ; 389 => mono/android/content/DialogInterface_OnCancelListenerImplementor
	i32 u0x56e0f077, ; 390 => android/text/SpannableStringInternal
	i32 u0x5703751a, ; 391 => android/widget/ProgressBar
	i32 u0x574ad8f7, ; 392 => crc640ec207abc449b2ca/ShellToolbarTracker
	i32 u0x576906ee, ; 393 => androidx/navigation/internal/NavContext
	i32 u0x5788ec77, ; 394 => androidx/core/view/AccessibilityDelegateCompat
	i32 u0x57dee6d9, ; 395 => android/view/animation/AnimationUtils
	i32 u0x57eb2dc6, ; 396 => com/microsoft/maui/PlatformShadowDrawable
	i32 u0x57f522af, ; 397 => java/util/HashMap
	i32 u0x57fe728e, ; 398 => javax/security/auth/Subject
	i32 u0x58467de4, ; 399 => android/graphics/drawable/Animatable
	i32 u0x588e1716, ; 400 => android/view/View$OnHoverListener
	i32 u0x58c968b2, ; 401 => java/nio/channels/spi/AbstractInterruptibleChannel
	i32 u0x58fa8e39, ; 402 => java/util/concurrent/Executor
	i32 u0x58feb1d7, ; 403 => androidx/appcompat/view/menu/MenuPresenter$Callback
	i32 u0x5924ac1f, ; 404 => crc645d80431ce5f73f11/NongreedySnapHelper_InitialScrollListener
	i32 u0x593adb3c, ; 405 => androidx/appcompat/app/AlertDialog_IDialogInterfaceOnClickListenerImplementor
	i32 u0x598dcd4c, ; 406 => com/google/crypto/tink/shaded/protobuf/WireFormat$JavaType
	i32 u0x5997339c, ; 407 => androidx/core/view/WindowInsetsCompat$Type
	i32 u0x59cf8f6b, ; 408 => android/widget/Button
	i32 u0x5a00a85b, ; 409 => androidx/core/text/PrecomputedTextCompat$Params
	i32 u0x5a0c1cc6, ; 410 => crc6452ffdc5b34af3a0f/ViewFragment
	i32 u0x5acdf5ad, ; 411 => androidx/viewpager2/widget/ViewPager2$PageTransformer
	i32 u0x5aeca5f1, ; 412 => java/security/PrivateKey
	i32 u0x5c10ee2c, ; 413 => java/io/File
	i32 u0x5c3a99ae, ; 414 => androidx/core/view/ViewGroupCompat
	i32 u0x5c494750, ; 415 => android/view/WindowManager$LayoutParams
	i32 u0x5c6b3b05, ; 416 => android/content/ContentProvider
	i32 u0x5c82230b, ; 417 => crc6452ffdc5b34af3a0f/MauiShapeableImageView
	i32 u0x5c9ae70f, ; 418 => android/graphics/LinearGradient
	i32 u0x5d560868, ; 419 => androidx/lifecycle/viewmodel/CreationExtras$Key
	i32 u0x5d588b71, ; 420 => java/util/Comparator
	i32 u0x5da461e9, ; 421 => crc64b5e713d400f589b7/LinearGradientShaderFactory
	i32 u0x5dc17518, ; 422 => android/widget/AutoCompleteTextView
	i32 u0x5dcecc9b, ; 423 => android/app/AlertDialog
	i32 u0x5e499d39, ; 424 => mono/androidx/appcompat/widget/Toolbar_OnMenuItemClickListenerImplementor
	i32 u0x5e552f1a, ; 425 => crc64f45d91b14e554859/MainActivity
	i32 u0x5e742e49, ; 426 => android/view/Display
	i32 u0x5e956e3c, ; 427 => android/os/Handler
	i32 u0x5ee96369, ; 428 => androidx/navigation/NavOptions
	i32 u0x60190a81, ; 429 => androidx/appcompat/widget/AppCompatTextView
	i32 u0x602a30a1, ; 430 => crc64338477404e88479c/ModalNavigationManager_ModalFragment
	i32 u0x60397957, ; 431 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat
	i32 u0x60696f62, ; 432 => kotlin/reflect/KType
	i32 u0x607c6b65, ; 433 => com/google/android/material/appbar/AppBarLayout$BaseBehavior
	i32 u0x60b33fcf, ; 434 => android/webkit/CookieManager
	i32 u0x613435ba, ; 435 => com/microsoft/maui/ImageLoaderCallback
	i32 u0x618fe440, ; 436 => android/os/IBinder$FrozenStateChangeCallback
	i32 u0x61a146b7, ; 437 => java/security/Principal
	i32 u0x620ad162, ; 438 => android/graphics/Matrix
	i32 u0x62182271, ; 439 => crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter_ElementViewHolder
	i32 u0x622147f6, ; 440 => android/view/View
	i32 u0x62545cb7, ; 441 => java/lang/RuntimeException
	i32 u0x62c5df0e, ; 442 => java/lang/IndexOutOfBoundsException
	i32 u0x630ec3df, ; 443 => android/view/View$OnTouchListener
	i32 u0x63ac2c80, ; 444 => crc645d80431ce5f73f11/TemplatedItemViewHolder
	i32 u0x63ccbb37, ; 445 => androidx/security/crypto/MasterKey
	i32 u0x64099c21, ; 446 => androidx/security/crypto/EncryptedSharedPreferences
	i32 u0x642f84c3, ; 447 => java/lang/Byte
	i32 u0x64361bd8, ; 448 => crc6452ffdc5b34af3a0f/MauiPickerBase
	i32 u0x6492fb02, ; 449 => mono/android/view/View_OnAttachStateChangeListenerImplementor
	i32 u0x64966a00, ; 450 => android/widget/CheckBox
	i32 u0x649adfeb, ; 451 => com/microsoft/maui/PlatformWrapperView
	i32 u0x650d9fe7, ; 452 => android/widget/EdgeEffect
	i32 u0x653fbff6, ; 453 => androidx/navigation/NavDestination$DeepLinkMatch
	i32 u0x654bd255, ; 454 => android/widget/CompoundButton
	i32 u0x6583928a, ; 455 => com/google/crypto/tink/shaded/protobuf/ByteString
	i32 u0x6597608e, ; 456 => android/view/ContentInfo
	i32 u0x665c41ad, ; 457 => androidx/navigation/NavDirections
	i32 u0x6663c472, ; 458 => androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$DefaultTab
	i32 u0x666aa4c6, ; 459 => java/lang/Character
	i32 u0x66d3bdea, ; 460 => kotlin/reflect/KParameter$Kind
	i32 u0x66ff73c3, ; 461 => android/view/animation/Animation$AnimationListener
	i32 u0x67045916, ; 462 => kotlin/coroutines/CoroutineContext$Key
	i32 u0x671880fe, ; 463 => android/view/MenuInflater
	i32 u0x6758efa2, ; 464 => android/content/ClipData$Item
	i32 u0x6772e35e, ; 465 => java/util/ListIterator
	i32 u0x67a3aa49, ; 466 => androidx/lifecycle/ViewModelStore
	i32 u0x67c2b7a7, ; 467 => android/widget/FrameLayout
	i32 u0x67c4792a, ; 468 => android/os/IInterface
	i32 u0x681a963a, ; 469 => android/app/Application$ActivityLifecycleCallbacks
	i32 u0x6827af36, ; 470 => com/google/android/material/appbar/AppBarLayout$LiftOnScrollListener
	i32 u0x689f8691, ; 471 => java/util/Random
	i32 u0x68b2b367, ; 472 => androidx/core/view/ActionProvider$VisibilityListener
	i32 u0x68b8500d, ; 473 => android/text/Layout
	i32 u0x68b9fbe9, ; 474 => android/graphics/drawable/shapes/RectShape
	i32 u0x68c2e1e6, ; 475 => crc6452ffdc5b34af3a0f/MauiTimePicker
	i32 u0x68d070f5, ; 476 => android/os/BaseBundle
	i32 u0x68fa7a8c, ; 477 => android/content/ClipData
	i32 u0x69399da8, ; 478 => crc645d80431ce5f73f11/MauiRecyclerView_3
	i32 u0x69828be4, ; 479 => kotlinx/serialization/KSerializer
	i32 u0x69a95714, ; 480 => android/graphics/Point
	i32 u0x69cd2b8d, ; 481 => crc64f728827fec74e9c3/Toolbar_Container
	i32 u0x69d1c518, ; 482 => android/content/res/ColorStateList
	i32 u0x6a1bd0c1, ; 483 => java/util/SequencedCollection
	i32 u0x6a234096, ; 484 => androidx/core/view/WindowInsetsAnimationControlListenerCompat
	i32 u0x6ab0fba2, ; 485 => com/google/crypto/tink/shaded/protobuf/ByteString$Output
	i32 u0x6ab4d8d7, ; 486 => android/text/Spanned
	i32 u0x6b1300b3, ; 487 => com/google/android/material/button/MaterialButton
	i32 u0x6bb7ffbf, ; 488 => android/view/View$OnClickListener
	i32 u0x6c313de9, ; 489 => kotlin/reflect/KFunction
	i32 u0x6cd3e11f, ; 490 => androidx/appcompat/widget/SearchView$OnCloseListener
	i32 u0x6cd77b83, ; 491 => androidx/appcompat/view/menu/SubMenuBuilder
	i32 u0x6d083925, ; 492 => crc64e1fb321c08285b90/SwitchCellView
	i32 u0x6d1f477f, ; 493 => android/graphics/drawable/ShapeDrawable
	i32 u0x6d652989, ; 494 => androidx/navigation/NavAction
	i32 u0x6d8a8ab7, ; 495 => crc64fcf28c0e24b4cc31/SliderHandler_SeekBarChangeListener
	i32 u0x6e082885, ; 496 => crc6452ffdc5b34af3a0f/MauiPageControl
	i32 u0x6e3aaade, ; 497 => com/google/android/material/appbar/AppBarLayout$Behavior
	i32 u0x6e5f2b64, ; 498 => java/lang/Runnable
	i32 u0x6e7c8b15, ; 499 => com/google/android/material/badge/BadgeDrawable
	i32 u0x6e92f3e9, ; 500 => androidx/appcompat/app/AlertDialog_IDialogInterfaceOnMultiChoiceClickListenerImplementor
	i32 u0x6e9aa4b9, ; 501 => mono/android/text/TextWatcherImplementor
	i32 u0x6ece3e1d, ; 502 => android/widget/LinearLayout
	i32 u0x6ef0b866, ; 503 => androidx/recyclerview/widget/RecyclerView$EdgeEffectFactory
	i32 u0x6f25776f, ; 504 => android/view/ViewConfiguration
	i32 u0x6f3d8b79, ; 505 => android/view/SearchEvent
	i32 u0x6f5e19df, ; 506 => net/dot/jni/internal/JavaProxyThrowable
	i32 u0x6f9085df, ; 507 => android/graphics/drawable/Drawable$ConstantState
	i32 u0x704e1132, ; 508 => crc64e1fb321c08285b90/BaseCellView
	i32 u0x705864f0, ; 509 => android/os/PowerManager
	i32 u0x705a3855, ; 510 => android/content/DialogInterface$OnMultiChoiceClickListener
	i32 u0x708c8a9b, ; 511 => kotlin/jvm/functions/Function1
	i32 u0x70a9a559, ; 512 => androidx/appcompat/widget/Toolbar_NavigationOnClickEventDispatcher
	i32 u0x70c5396a, ; 513 => android/graphics/drawable/InsetDrawable
	i32 u0x70de2257, ; 514 => androidx/fragment/app/FragmentActivity
	i32 u0x718714c5, ; 515 => android/text/style/ForegroundColorSpan
	i32 u0x718da316, ; 516 => androidx/lifecycle/ViewModelProvider
	i32 u0x71e3cb66, ; 517 => com/google/android/material/checkbox/MaterialCheckBox$OnErrorChangedListener
	i32 u0x7204c6b6, ; 518 => crc6452ffdc5b34af3a0f/MauiDatePicker
	i32 u0x72db92de, ; 519 => androidx/lifecycle/Lifecycle$Event
	i32 u0x73946ca3, ; 520 => com/microsoft/maui/PlatformMauiAppCompatActivity
	i32 u0x73dbb303, ; 521 => android/widget/AdapterView$OnItemSelectedListener
	i32 u0x73e1105c, ; 522 => java/io/OutputStream
	i32 u0x74e24c4e, ; 523 => mono/android/content/DialogInterface_OnDismissListenerImplementor
	i32 u0x74f3ac63, ; 524 => android/content/BroadcastReceiver
	i32 u0x752e0221, ; 525 => androidx/fragment/app/FragmentManager
	i32 u0x754292b2, ; 526 => androidx/navigation/NavArgument
	i32 u0x7562d335, ; 527 => mono/com/google/android/material/appbar/AppBarLayout_LiftOnScrollListenerImplementor
	i32 u0x756f6f77, ; 528 => crc6452ffdc5b34af3a0f/StepperHandlerHolder
	i32 u0x7573a76b, ; 529 => crc64338477404e88479c/DragAndDropGestureHandler_CustomLocalStateData
	i32 u0x75743229, ; 530 => androidx/appcompat/app/AlertDialog$Builder
	i32 u0x75976883, ; 531 => crc640ec207abc449b2ca/ShellPageContainer
	i32 u0x75c34d61, ; 532 => androidx/viewpager2/adapter/FragmentStateAdapter
	i32 u0x75c9a43f, ; 533 => com/google/android/material/shape/EdgeTreatment
	i32 u0x75d35057, ; 534 => com/google/android/material/bottomsheet/BottomSheetDialog
	i32 u0x765ee0ac, ; 535 => android/app/Activity
	i32 u0x767c0d39, ; 536 => java/lang/Boolean
	i32 u0x768561de, ; 537 => crc6452ffdc5b34af3a0f/MauiPageControl_TEditClickListener
	i32 u0x76a65018, ; 538 => android/widget/AdapterView$OnItemClickListener
	i32 u0x772ee9d8, ; 539 => android/graphics/drawable/GradientDrawable
	i32 u0x77b0a344, ; 540 => android/content/Intent
	i32 u0x77bf1500, ; 541 => com/google/android/material/elevation/ElevationOverlayProvider
	i32 u0x77e098bc, ; 542 => androidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat
	i32 u0x780abb64, ; 543 => androidx/appcompat/widget/AppCompatImageView
	i32 u0x781647f7, ; 544 => android/view/accessibility/AccessibilityRecord
	i32 u0x78cbc3b9, ; 545 => android/widget/FrameLayout$LayoutParams
	i32 u0x78dd82d8, ; 546 => android/view/ContextThemeWrapper
	i32 u0x791579f7, ; 547 => android/widget/AdapterView
	i32 u0x7963618e, ; 548 => android/content/DialogInterface
	i32 u0x7993c871, ; 549 => android/widget/TimePicker
	i32 u0x79c4b7dd, ; 550 => android/text/style/BulletSpan
	i32 u0x79c62bf1, ; 551 => android/os/Parcelable$Creator
	i32 u0x79cac366, ; 552 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$TouchDelegateInfoCompat
	i32 u0x79e9460d, ; 553 => com/google/android/material/checkbox/MaterialCheckBox$OnCheckedStateChangedListener
	i32 u0x79fc40da, ; 554 => java/util/Locale
	i32 u0x7a0dbe3c, ; 555 => android/webkit/WebChromeClient$FileChooserParams
	i32 u0x7a3f2e65, ; 556 => java/util/function/ToLongFunction
	i32 u0x7a6505ce, ; 557 => mono/androidx/viewpager/widget/ViewPager_OnPageChangeListenerImplementor
	i32 u0x7a73c9e6, ; 558 => androidx/recyclerview/widget/RecyclerView$Recycler
	i32 u0x7ae35f4c, ; 559 => android/database/CharArrayBuffer
	i32 u0x7b05ec59, ; 560 => android/view/animation/Animation
	i32 u0x7b112ed3, ; 561 => android/widget/SpinnerAdapter
	i32 u0x7b26a38a, ; 562 => mono/com/google/android/material/appbar/AppBarLayout_OnOffsetChangedListenerImplementor
	i32 u0x7b89e3c9, ; 563 => crc64b5e713d400f589b7/MauiDrawable
	i32 u0x7b949de0, ; 564 => android/app/AlertDialog$Builder
	i32 u0x7bbef866, ; 565 => androidx/navigation/NavGraphNavigator
	i32 u0x7bf686d2, ; 566 => android/content/IntentSender
	i32 u0x7c04bc64, ; 567 => java/security/SecureRandom
	i32 u0x7c07630b, ; 568 => crc64fcf28c0e24b4cc31/SearchBarHandler_FocusChangeListener
	i32 u0x7c9f6d9f, ; 569 => android/os/Environment
	i32 u0x7ca2ec86, ; 570 => androidx/fragment/app/FragmentManager$BackStackEntry
	i32 u0x7cf48e43, ; 571 => android/widget/AbsSeekBar
	i32 u0x7d39e03d, ; 572 => android/graphics/Path
	i32 u0x7dc43ae1, ; 573 => android/window/InputTransferToken
	i32 u0x7df3df82, ; 574 => androidx/appcompat/widget/SearchView$OnQueryTextListener
	i32 u0x7e04b61a, ; 575 => android/content/res/Configuration
	i32 u0x7e7413f3, ; 576 => kotlin/jvm/internal/markers/KMappedMarker
	i32 u0x7e7dc740, ; 577 => kotlin/coroutines/Continuation
	i32 u0x7e97d929, ; 578 => android/content/ContentValues
	i32 u0x7edb32fa, ; 579 => androidx/loader/app/LoaderManager
	i32 u0x7ef77429, ; 580 => kotlinx/coroutines/flow/SharedFlow
	i32 u0x7f0bcdf3, ; 581 => android/animation/AnimatorListenerAdapter
	i32 u0x7f5f2883, ; 582 => crc64338477404e88479c/FragmentContainer
	i32 u0x7f668fbf, ; 583 => crc640a8d9a12ddbf2cf2/DeviceDisplayImplementation_Listener
	i32 u0x7f90f27b, ; 584 => androidx/navigation/NavGraph
	i32 u0x7fb69f47, ; 585 => com/google/android/material/appbar/AppBarLayout
	i32 u0x7ffc1047, ; 586 => com/google/crypto/tink/shaded/protobuf/WireFormat
	i32 u0x801f5d9d, ; 587 => crc64e1fb321c08285b90/ConditionalFocusLayout
	i32 u0x806b383f, ; 588 => android/view/animation/AnimationSet
	i32 u0x806ed615, ; 589 => com/google/android/material/tabs/TabLayout
	i32 u0x814108db, ; 590 => kotlin/reflect/KCallable
	i32 u0x8154e383, ; 591 => com/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite
	i32 u0x816ed070, ; 592 => androidx/navigation/NavDestination
	i32 u0x81a4c641, ; 593 => com/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener
	i32 u0x81c3131c, ; 594 => androidx/lifecycle/Lifecycle
	i32 u0x82225f2a, ; 595 => mono/android/widget/CompoundButton_OnCheckedChangeListenerImplementor
	i32 u0x827a2712, ; 596 => android/graphics/Paint$FontMetrics
	i32 u0x828c7aaa, ; 597 => java/security/Key
	i32 u0x82a50e2b, ; 598 => androidx/lifecycle/Lifecycle$State
	i32 u0x82ac1c5f, ; 599 => androidx/coordinatorlayout/widget/CoordinatorLayout$Behavior
	i32 u0x83625f1e, ; 600 => org/xmlpull/v1/XmlPullParser
	i32 u0x83a26d33, ; 601 => mono/android/content/DialogInterface_OnShowListenerImplementor
	i32 u0x84105191, ; 602 => crc645d80431ce5f73f11/TextViewHolder
	i32 u0x8479e442, ; 603 => com/google/crypto/tink/shaded/protobuf/MessageLite
	i32 u0x848534fd, ; 604 => androidx/appcompat/widget/TooltipCompat
	i32 u0x84c04103, ; 605 => androidx/fragment/app/FragmentOnAttachListener
	i32 u0x84fcfe0d, ; 606 => androidx/core/app/ActivityOptionsCompat
	i32 u0x854542ba, ; 607 => androidx/core/view/ActionProvider$SubUiVisibilityListener
	i32 u0x85a05c5d, ; 608 => androidx/appcompat/widget/ScrollingTabContainerView
	i32 u0x85ee6357, ; 609 => androidx/navigation/Navigator$Extras
	i32 u0x868456ef, ; 610 => crc6452ffdc5b34af3a0f/WrapperView
	i32 u0x871f05f2, ; 611 => crc6452ffdc5b34af3a0f/MauiWebView
	i32 u0x8724f930, ; 612 => androidx/recyclerview/widget/RecyclerView$OnFlingListener
	i32 u0x873fa2a1, ; 613 => java/net/UnknownServiceException
	i32 u0x875b8bea, ; 614 => java/net/Proxy$Type
	i32 u0x87a0f669, ; 615 => androidx/core/view/MenuItemCompat$OnActionExpandListener
	i32 u0x87e3ff73, ; 616 => androidx/appcompat/widget/AppCompatImageButton
	i32 u0x882d17e1, ; 617 => android/app/Application
	i32 u0x8830928f, ; 618 => com/microsoft/maui/PlatformDispatcher
	i32 u0x886b9456, ; 619 => com/google/android/material/checkbox/MaterialCheckBox
	i32 u0x88c5fabc, ; 620 => android/view/accessibility/AccessibilityNodeInfo
	i32 u0x88cf1b4e, ; 621 => androidx/fragment/app/FragmentManager$OnBackStackChangedListener
	i32 u0x88e074f7, ; 622 => android/content/IntentFilter
	i32 u0x890ff770, ; 623 => [J
	i32 u0x893ab6b3, ; 624 => kotlinx/serialization/SerializationStrategy
	i32 u0x898049cc, ; 625 => com/google/crypto/tink/shaded/protobuf/Parser
	i32 u0x89a49e25, ; 626 => android/graphics/Path$Op
	i32 u0x89c2c9ef, ; 627 => com/google/android/material/appbar/ViewOffsetBehavior
	i32 u0x8a121279, ; 628 => androidx/lifecycle/ViewModelStoreOwner
	i32 u0x8a35f941, ; 629 => kotlin/reflect/KVariance
	i32 u0x8a4bc22b, ; 630 => crc64338477404e88479c/MauiViewPager
	i32 u0x8a67f0b6, ; 631 => kotlin/reflect/KTypeProjection
	i32 u0x8a9efa0c, ; 632 => java/lang/Iterable
	i32 u0x8ae4259c, ; 633 => androidx/activity/result/ActivityResultCallback
	i32 u0x8af094d1, ; 634 => crc6452ffdc5b34af3a0f/BorderDrawable
	i32 u0x8b6202b1, ; 635 => android/view/contentcapture/ContentCaptureSession
	i32 u0x8b8800b8, ; 636 => androidx/recyclerview/widget/PagerSnapHelper
	i32 u0x8c1a4154, ; 637 => androidx/recyclerview/widget/RecyclerView$OnScrollListener
	i32 u0x8cb0a476, ; 638 => crc64338477404e88479c/InnerScaleListener
	i32 u0x8ce3a5d6, ; 639 => java/lang/Enum
	i32 u0x8d1d3103, ; 640 => android/widget/SearchView
	i32 u0x8d57f1bc, ; 641 => android/widget/Switch
	i32 u0x8e637552, ; 642 => crc645d80431ce5f73f11/MauiCarouselRecyclerView_CarouselViewOnGlobalLayoutListener
	i32 u0x8e6ad92b, ; 643 => android/view/ViewStructure
	i32 u0x8ecc3a71, ; 644 => android/view/View$OnLayoutChangeListener
	i32 u0x8ed9958c, ; 645 => androidx/swiperefreshlayout/widget/SwipeRefreshLayout
	i32 u0x8eff3e69, ; 646 => androidx/recyclerview/widget/RecyclerView
	i32 u0x8f4b02f6, ; 647 => android/app/PendingIntent
	i32 u0x8f68a41d, ; 648 => android/graphics/Shader
	i32 u0x8fa17b2d, ; 649 => android/util/TypedValue
	i32 u0x8fbb1ca5, ; 650 => java/lang/UnsupportedOperationException
	i32 u0x903fdde8, ; 651 => android/content/res/Resources$Theme
	i32 u0x90aa95f0, ; 652 => mono/android/widget/TextView_OnEditorActionListenerImplementor
	i32 u0x90cdc46b, ; 653 => crc6452ffdc5b34af3a0f/WebViewExtensions_JavascriptResult
	i32 u0x90f2ce20, ; 654 => com/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException
	i32 u0x91368633, ; 655 => androidx/cursoradapter/widget/CursorAdapter
	i32 u0x9164c142, ; 656 => crc640ec207abc449b2ca/ShellToolbarTracker_FlyoutIconDrawerDrawable
	i32 u0x918f9763, ; 657 => androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener
	i32 u0x91a3eaf3, ; 658 => java/net/SocketException
	i32 u0x91a87d29, ; 659 => android/graphics/PathEffect
	i32 u0x91a93d72, ; 660 => androidx/recyclerview/widget/RecyclerView$ChildDrawingOrderCallback
	i32 u0x91b08077, ; 661 => crc64e1fb321c08285b90/EntryCellEditText
	i32 u0x920377cb, ; 662 => mono/com/google/android/material/navigation/NavigationBarView_OnItemReselectedListenerImplementor
	i32 u0x922a94b5, ; 663 => java/io/RandomAccessFile
	i32 u0x9254a809, ; 664 => android/view/WindowInsetsAnimationControlListener
	i32 u0x929b0a45, ; 665 => com/google/android/material/appbar/AppBarLayout$ChildScrollEffect
	i32 u0x929cda6a, ; 666 => androidx/recyclerview/widget/ItemTouchUIUtil
	i32 u0x92a4a287, ; 667 => kotlinx/serialization/encoding/CompositeEncoder
	i32 u0x92b40e49, ; 668 => org/xmlpull/v1/XmlPullParserException
	i32 u0x92e47122, ; 669 => crc6452ffdc5b34af3a0f/SwipeViewPager
	i32 u0x9313713b, ; 670 => android/window/OnBackInvokedDispatcher
	i32 u0x93615193, ; 671 => crc6452ffdc5b34af3a0f/ContentViewGroup
	i32 u0x938427ee, ; 672 => crc64338477404e88479c/ModalNavigationManager_ModalFragment_CustomComponentDialog_CallBack
	i32 u0x93a0f3b2, ; 673 => crc640ec207abc449b2ca/ShellSearchViewAdapter_CustomFilter
	i32 u0x93a19d5c, ; 674 => crc640ec207abc449b2ca/ShellFragmentStateAdapter
	i32 u0x93c633e2, ; 675 => androidx/core/view/WindowInsetsAnimationControllerCompat
	i32 u0x93e1af4c, ; 676 => mono/androidx/fragment/app/FragmentOnAttachListenerImplementor
	i32 u0x941c28a5, ; 677 => android/webkit/WebSettings
	i32 u0x949cba0b, ; 678 => android/text/StaticLayout
	i32 u0x9573bcb0, ; 679 => crc640ec207abc449b2ca/ShellSearchView
	i32 u0x95a99c55, ; 680 => com/google/android/material/appbar/HeaderScrollingViewBehavior
	i32 u0x96f82d4f, ; 681 => android/content/SharedPreferences$OnSharedPreferenceChangeListener
	i32 u0x97807eec, ; 682 => android/view/ContextMenu$ContextMenuInfo
	i32 u0x97a30613, ; 683 => androidx/core/view/MenuItemCompat
	i32 u0x97db463b, ; 684 => com/microsoft/maui/PlatformContentViewGroup
	i32 u0x9820b7c9, ; 685 => androidx/core/view/ScrollingView
	i32 u0x983a46b3, ; 686 => [I
	i32 u0x9871c90a, ; 687 => mono/androidx/recyclerview/widget/RecyclerView_OnItemTouchListenerImplementor
	i32 u0x9873a0ac, ; 688 => com/google/android/material/tabs/TabLayout$OnTabSelectedListener
	i32 u0x987a2d5e, ; 689 => java/io/FileInputStream
	i32 u0x987e88d8, ; 690 => crc6452ffdc5b34af3a0f/MauiAccessibilityDelegateCompat
	i32 u0x9881b4d0, ; 691 => android/graphics/drawable/Icon
	i32 u0x98ebcde1, ; 692 => android/app/DatePickerDialog$OnDateSetListener
	i32 u0x99197446, ; 693 => androidx/appcompat/widget/AppCompatEditText
	i32 u0x9926febb, ; 694 => android/view/WindowInsetsController$OnControllableInsetsChangedListener
	i32 u0x99631a62, ; 695 => crc6488302ad6e9e4df1a/MauiApplication_ActivityLifecycleCallbacks
	i32 u0x99ae9b84, ; 696 => android/widget/ImageView$ScaleType
	i32 u0x99b1b0b7, ; 697 => com/microsoft/maui/HybridJavaScriptInterface
	i32 u0x99eec34b, ; 698 => androidx/navigation/NavController$OnDestinationChangedListener
	i32 u0x99f64847, ; 699 => mono/android/animation/AnimatorEventDispatcher
	i32 u0x9a1d2e88, ; 700 => java/text/NumberFormat
	i32 u0x9a2f021b, ; 701 => android/content/DialogInterface$OnKeyListener
	i32 u0x9a5b486e, ; 702 => androidx/activity/result/contract/ActivityResultContracts$PickMultipleVisualMedia
	i32 u0x9aa0facc, ; 703 => android/widget/BaseAdapter
	i32 u0x9aecfcdd, ; 704 => com/google/crypto/tink/shaded/protobuf/Internal$EnumLiteMap
	i32 u0x9aed999f, ; 705 => android/view/SurfaceControl
	i32 u0x9b0e465f, ; 706 => androidx/navigation/NavDeepLinkRequest
	i32 u0x9b179eb2, ; 707 => crc6452ffdc5b34af3a0f/MauiLayerDrawable
	i32 u0x9ca1b50a, ; 708 => [F
	i32 u0x9ca85dca, ; 709 => android/content/DialogInterface$OnCancelListener
	i32 u0x9d2fdb8f, ; 710 => android/content/pm/PackageManager
	i32 u0x9d44121c, ; 711 => androidx/appcompat/app/AppCompatDelegate
	i32 u0x9d7610df, ; 712 => java/security/GeneralSecurityException
	i32 u0x9d796341, ; 713 => com/google/android/material/navigation/NavigationView
	i32 u0x9d7fe3dc, ; 714 => android/content/pm/Signature
	i32 u0x9da7ab0b, ; 715 => androidx/core/widget/NestedScrollView
	i32 u0x9da99a31, ; 716 => androidx/core/app/ComponentActivity$ExtraData
	i32 u0x9dd23514, ; 717 => androidx/core/graphics/drawable/DrawableCompat
	i32 u0x9df33784, ; 718 => androidx/recyclerview/widget/RecyclerView$Adapter$StateRestorationPolicy
	i32 u0x9e00de95, ; 719 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat
	i32 u0x9e3b164d, ; 720 => java/io/InterruptedIOException
	i32 u0x9ea9f8cf, ; 721 => android/widget/ImageButton
	i32 u0x9ebf0e07, ; 722 => mono/java/lang/Runnable
	i32 u0x9ed79303, ; 723 => javax/net/ssl/HostnameVerifier
	i32 u0x9eee9881, ; 724 => com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite
	i32 u0x9f11a71b, ; 725 => kotlin/reflect/KDeclarationContainer
	i32 u0x9f1e7849, ; 726 => crc6452ffdc5b34af3a0f/MauiAppCompatEditText
	i32 u0x9f7aa877, ; 727 => android/webkit/WebViewClient
	i32 u0x9fba5c10, ; 728 => android/view/KeyboardShortcutInfo
	i32 u0x9fc26a20, ; 729 => mono/android/view/ViewGroup_OnHierarchyChangeListenerImplementor
	i32 u0x9fd00367, ; 730 => android/widget/Adapter
	i32 u0x9fdb1e25, ; 731 => androidx/appcompat/graphics/drawable/DrawableWrapperCompat
	i32 u0x9fdbe44e, ; 732 => android/view/MotionEvent
	i32 u0xa0231ae3, ; 733 => androidx/core/view/WindowInsetsCompat$Builder
	i32 u0xa0343f64, ; 734 => android/widget/TextView
	i32 u0xa067f1d6, ; 735 => crc64b5e713d400f589b7/RadialGradientShaderFactory
	i32 u0xa06b62e4, ; 736 => com/google/crypto/tink/shaded/protobuf/Internal$BooleanList
	i32 u0xa06deb73, ; 737 => android/view/View$OnKeyListener
	i32 u0xa0ad0a01, ; 738 => crc645d80431ce5f73f11/SingleSnapHelper
	i32 u0xa0e7f4d5, ; 739 => android/webkit/WebResourceRequest
	i32 u0xa10b2832, ; 740 => androidx/lifecycle/viewmodel/ViewModelInitializer
	i32 u0xa10dac39, ; 741 => androidx/appcompat/widget/SwitchCompat
	i32 u0xa1717eed, ; 742 => android/graphics/drawable/ShapeDrawable$ShaderFactory
	i32 u0xa2347fe6, ; 743 => crc64fcf28c0e24b4cc31/ButtonHandler_ButtonClickListener
	i32 u0xa2384ed3, ; 744 => android/graphics/drawable/Drawable
	i32 u0xa2d12ed5, ; 745 => android/view/View$MeasureSpec
	i32 u0xa304302a, ; 746 => androidx/core/widget/NestedScrollView$OnScrollChangeListener
	i32 u0xa309b341, ; 747 => com/google/android/material/dialog/MaterialAlertDialogBuilder
	i32 u0xa37de40c, ; 748 => androidx/activity/result/ActivityResultRegistry
	i32 u0xa3ce43ef, ; 749 => crc64e1fb321c08285b90/TableViewModelRenderer
	i32 u0xa4416377, ; 750 => android/text/Spannable
	i32 u0xa4ab3847, ; 751 => java/lang/Float
	i32 u0xa537c29d, ; 752 => android/graphics/drawable/LayerDrawable
	i32 u0xa5d6e364, ; 753 => androidx/appcompat/widget/SearchView$OnSuggestionListener
	i32 u0xa63f9a0a, ; 754 => androidx/navigation/NavInflater
	i32 u0xa6b4071d, ; 755 => android/text/format/DateFormat
	i32 u0xa70f782c, ; 756 => crc6452ffdc5b34af3a0f/MauiScrollView
	i32 u0xa7267cfd, ; 757 => android/security/KeyStoreException
	i32 u0xa73d7bb6, ; 758 => com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$MethodToInvoke
	i32 u0xa7d2e3c3, ; 759 => android/os/Build
	i32 u0xa7f9e1e3, ; 760 => crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter_ShellLinearLayout
	i32 u0xa82239ca, ; 761 => crc6452ffdc5b34af3a0f/MauiBoxView
	i32 u0xa855e6a7, ; 762 => androidx/appcompat/widget/AppCompatButton
	i32 u0xa91fd561, ; 763 => android/view/DragEvent
	i32 u0xa96e63d3, ; 764 => crc645d80431ce5f73f11/ScrollHelper
	i32 u0xa9e1e5e2, ; 765 => java/util/function/IntFunction
	i32 u0xaa090c56, ; 766 => androidx/cardview/widget/CardView
	i32 u0xaa4a698b, ; 767 => com/google/android/material/shape/CornerTreatment
	i32 u0xaa4fbe78, ; 768 => mono/android/view/View_OnKeyListenerImplementor
	i32 u0xaa714f7e, ; 769 => java/util/Spliterator
	i32 u0xaa722a66, ; 770 => android/view/WindowInsetsAnimation$Bounds
	i32 u0xaa8288ed, ; 771 => crc640ec207abc449b2ca/ShellFlyoutLayout
	i32 u0xaaa43bcf, ; 772 => androidx/core/view/ActionProvider
	i32 u0xaad17d09, ; 773 => androidx/recyclerview/widget/SnapHelper
	i32 u0xaae19488, ; 774 => android/view/ActionMode
	i32 u0xab40258f, ; 775 => android/content/pm/PackageInfo
	i32 u0xab580b31, ; 776 => java/lang/StackTraceElement
	i32 u0xad202668, ; 777 => android/view/WindowInsetsAnimationController
	i32 u0xad2a0fae, ; 778 => android/text/style/ParagraphStyle
	i32 u0xad6c6892, ; 779 => androidx/recyclerview/widget/RecyclerView$ItemAnimator$ItemHolderInfo
	i32 u0xadf680a3, ; 780 => android/content/DialogInterface$OnClickListener
	i32 u0xae14b418, ; 781 => androidx/security/crypto/EncryptedSharedPreferences$PrefKeyEncryptionScheme
	i32 u0xae34b971, ; 782 => android/graphics/BlendMode
	i32 u0xaed01dcc, ; 783 => android/view/InputEvent
	i32 u0xaeddab28, ; 784 => android/util/AttributeSet
	i32 u0xaf084182, ; 785 => androidx/fragment/app/strictmode/Violation
	i32 u0xaf0e9942, ; 786 => androidx/recyclerview/widget/LinearSmoothScroller
	i32 u0xaf6773fc, ; 787 => java/lang/Exception
	i32 u0xaf73e94d, ; 788 => crc645d80431ce5f73f11/MauiCarouselRecyclerView
	i32 u0xaf862ea3, ; 789 => android/widget/ListView
	i32 u0xb00cb718, ; 790 => android/view/WindowInsetsController
	i32 u0xb01f0e14, ; 791 => androidx/appcompat/app/ActionBar
	i32 u0xb0a3f732, ; 792 => androidx/viewpager/widget/ViewPager$OnAdapterChangeListener
	i32 u0xb0f78dd9, ; 793 => mono/android/view/animation/Animation_AnimationListenerImplementor
	i32 u0xb152a219, ; 794 => java/text/Format
	i32 u0xb1a6fc2a, ; 795 => mono/android/runtime/JavaArray
	i32 u0xb1d7f461, ; 796 => mono/android/TypeManager
	i32 u0xb1f26d38, ; 797 => android/text/method/DigitsKeyListener
	i32 u0xb253e191, ; 798 => crc645d80431ce5f73f11/SelectableViewHolder
	i32 u0xb27fd2fc, ; 799 => androidx/core/view/WindowInsetsAnimationCompat$BoundsCompat
	i32 u0xb2c7c079, ; 800 => androidx/core/view/ContentInfoCompat
	i32 u0xb2d9b850, ; 801 => crc645d80431ce5f73f11/SizedItemContentView
	i32 u0xb2e0546e, ; 802 => crc6488302ad6e9e4df1a/ImageLoaderResultCallback
	i32 u0xb2ea14bd, ; 803 => crc645d80431ce5f73f11/SpacingItemDecoration
	i32 u0xb2f122ea, ; 804 => androidx/recyclerview/widget/RecyclerView$SmoothScroller$Action
	i32 u0xb36373f3, ; 805 => androidx/savedstate/SavedStateRegistry$SavedStateProvider
	i32 u0xb37a7bd1, ; 806 => androidx/appcompat/app/ActionBar$LayoutParams
	i32 u0xb3aaaba5, ; 807 => crc64e1fb321c08285b90/CellAdapter
	i32 u0xb3b2298b, ; 808 => kotlin/Function
	i32 u0xb41bb47f, ; 809 => crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer
	i32 u0xb4216866, ; 810 => crc64338477404e88479c/ControlsAccessibilityDelegate
	i32 u0xb4355675, ; 811 => android/text/SpannableString
	i32 u0xb438f723, ; 812 => com/microsoft/maui/PlatformAppCompatTextView
	i32 u0xb47b8436, ; 813 => crc645d80431ce5f73f11/DataChangeObserver
	i32 u0xb4bbbc1b, ; 814 => [C
	i32 u0xb5efe08f, ; 815 => android/view/animation/DecelerateInterpolator
	i32 u0xb5f14d6b, ; 816 => com/google/android/material/shape/CornerSize
	i32 u0xb6265a3c, ; 817 => androidx/core/view/WindowInsetsAnimationCompat
	i32 u0xb7220b27, ; 818 => java/util/concurrent/Future
	i32 u0xb74574e5, ; 819 => androidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback
	i32 u0xb751e489, ; 820 => androidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams
	i32 u0xb783dae8, ; 821 => crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter
	i32 u0xb7b96051, ; 822 => crc64e1fb321c08285b90/ListViewAdapter
	i32 u0xb7c06eb6, ; 823 => android/util/Pair
	i32 u0xb7e59bab, ; 824 => com/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback
	i32 u0xb7ff321b, ; 825 => androidx/appcompat/app/ActionBarDrawerToggle
	i32 u0xb803c5fe, ; 826 => android/preference/PreferenceManager
	i32 u0xb8b0d69a, ; 827 => android/webkit/WebResourceError
	i32 u0xb91a1a14, ; 828 => crc640ec207abc449b2ca/ShellSearchViewAdapter
	i32 u0xb92af814, ; 829 => androidx/viewpager2/widget/ViewPager2
	i32 u0xb9465a21, ; 830 => crc645d80431ce5f73f11/CarouselViewAdapter_2
	i32 u0xb9c52a1f, ; 831 => android/view/View$AccessibilityDelegate
	i32 u0xb9cef92b, ; 832 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat
	i32 u0xb9dbcdb9, ; 833 => crc64338477404e88479c/InnerGestureListener
	i32 u0xb9f9d446, ; 834 => crc6452ffdc5b34af3a0f/StackNavigationManager_Callbacks
	i32 u0xbb361208, ; 835 => crc6452ffdc5b34af3a0f/MauiMaterialButton_MauiResizableDrawable
	i32 u0xbb3e4f07, ; 836 => android/view/ScaleGestureDetector
	i32 u0xbb77c486, ; 837 => crc645d80431ce5f73f11/ItemContentView
	i32 u0xbb977183, ; 838 => crc645d80431ce5f73f11/CarouselViewOnScrollListener
	i32 u0xbba3aad6, ; 839 => android/animation/ValueAnimator$AnimatorUpdateListener
	i32 u0xbbcd0eb2, ; 840 => mono/androidx/appcompat/widget/SearchView_OnSuggestionListenerImplementor
	i32 u0xbbda7222, ; 841 => androidx/appcompat/view/menu/MenuItemImpl
	i32 u0xbbfffad3, ; 842 => androidx/appcompat/view/menu/MenuBuilder$Callback
	i32 u0xbc6f132f, ; 843 => crc64f45d91b14e554859/MainApplication
	i32 u0xbc73ced5, ; 844 => androidx/appcompat/content/res/AppCompatResources
	i32 u0xbc9ed48b, ; 845 => mono/androidx/drawerlayout/widget/DrawerLayout_DrawerListenerImplementor
	i32 u0xbd2317bb, ; 846 => android/content/pm/ShortcutInfo
	i32 u0xbd262c45, ; 847 => android/os/IBinder
	i32 u0xbd267561, ; 848 => android/graphics/Path$Direction
	i32 u0xbd71139f, ; 849 => android/view/inputmethod/InputMethodManager
	i32 u0xbd79b67e, ; 850 => com/microsoft/maui/PlatformLineHeightSpan
	i32 u0xbd9816ec, ; 851 => androidx/appcompat/widget/LinearLayoutCompat
	i32 u0xbdbcdc8f, ; 852 => android/view/ActionMode$Callback
	i32 u0xbdd653d9, ; 853 => crc645d80431ce5f73f11/SimpleItemTouchHelperCallback
	i32 u0xbddd6b44, ; 854 => androidx/navigation/NavigatorState
	i32 u0xbe184831, ; 855 => android/graphics/MaskFilter
	i32 u0xbe1e310b, ; 856 => androidx/appcompat/widget/Toolbar$OnMenuItemClickListener
	i32 u0xbe57cab0, ; 857 => android/text/style/ClickableSpan
	i32 u0xbe7236f1, ; 858 => com/google/android/material/shape/ShapeAppearanceModel
	i32 u0xbed6d31f, ; 859 => android/content/ClipDescription
	i32 u0xbeeddf83, ; 860 => android/widget/SeekBar
	i32 u0xbeef72b4, ; 861 => android/view/KeyboardShortcutGroup
	i32 u0xbf32553d, ; 862 => android/os/LocaleList
	i32 u0xbf81390e, ; 863 => com/google/crypto/tink/shaded/protobuf/Internal
	i32 u0xbf9d1a04, ; 864 => android/view/WindowManager
	i32 u0xbfc38a7b, ; 865 => androidx/security/crypto/MasterKey$Builder
	i32 u0xbfeacd6d, ; 866 => crc6468b6408a11370c2f/WebAuthenticatorIntermediateActivity
	i32 u0xbff0c2b9, ; 867 => androidx/navigation/NavType
	i32 u0xc019ab9d, ; 868 => androidx/recyclerview/widget/ItemTouchHelper$Callback
	i32 u0xc02ffb33, ; 869 => kotlin/jvm/functions/Function0
	i32 u0xc039ad33, ; 870 => androidx/recyclerview/widget/RecyclerView$LayoutManager$Properties
	i32 u0xc166dc4b, ; 871 => crc640ec207abc449b2ca/ShellItemRenderer
	i32 u0xc189e81b, ; 872 => crc64fcf28c0e24b4cc31/ToolbarHandler_ProcessBackClick
	i32 u0xc1a8a34a, ; 873 => kotlinx/coroutines/flow/Flow
	i32 u0xc1af7a0a, ; 874 => android/window/BackEvent
	i32 u0xc20d3e5c, ; 875 => com/google/android/material/navigation/NavigationBarMenuView
	i32 u0xc27806ec, ; 876 => android/graphics/BlurMaskFilter$Blur
	i32 u0xc2f8d665, ; 877 => mono/android/view/View_OnLayoutChangeListenerImplementor
	i32 u0xc39e36a2, ; 878 => android/view/MenuItem
	i32 u0xc3ca720c, ; 879 => java/util/RandomAccess
	i32 u0xc3f2d711, ; 880 => androidx/activity/FullyDrawnReporter
	i32 u0xc3f7408a, ; 881 => crc645d80431ce5f73f11/EdgeSnapHelper
	i32 u0xc41ddd9a, ; 882 => android/view/ViewPropertyAnimator
	i32 u0xc456317e, ; 883 => android/graphics/Shader$TileMode
	i32 u0xc48747d2, ; 884 => kotlinx/coroutines/CoroutineScope
	i32 u0xc4acc23e, ; 885 => androidx/core/view/ScaleGestureDetectorCompat
	i32 u0xc4bfd570, ; 886 => javax/net/ssl/SSLSession
	i32 u0xc4caaec0, ; 887 => android/text/method/MovementMethod
	i32 u0xc4e3199e, ; 888 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat
	i32 u0xc4f9e681, ; 889 => androidx/navigation/NavBackStackEntry
	i32 u0xc559a1c3, ; 890 => com/google/crypto/tink/shaded/protobuf/LazyFieldLite
	i32 u0xc56e7e9d, ; 891 => com/google/android/material/navigation/NavigationView$OnNavigationItemSelectedListener
	i32 u0xc5df2394, ; 892 => java/net/Proxy
	i32 u0xc5f08444, ; 893 => androidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener
	i32 u0xc6d796a7, ; 894 => crc6452ffdc5b34af3a0f/MauiHybridWebViewClient
	i32 u0xc70f7058, ; 895 => androidx/core/util/Predicate
	i32 u0xc726531b, ; 896 => androidx/fragment/app/strictmode/FragmentStrictMode
	i32 u0xc73e8ae5, ; 897 => androidx/recyclerview/widget/LinearSnapHelper
	i32 u0xc74fb4e7, ; 898 => crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer_TapGestureListener
	i32 u0xc75b6eef, ; 899 => androidx/core/view/ViewStructureCompat
	i32 u0xc78628c1, ; 900 => android/graphics/Insets
	i32 u0xc8148a69, ; 901 => android/graphics/DashPathEffect
	i32 u0xc83ffa94, ; 902 => crc645d80431ce5f73f11/ReorderableItemsViewAdapter_2
	i32 u0xc8c8236e, ; 903 => android/graphics/drawable/shapes/Shape
	i32 u0xc8e082ac, ; 904 => crc6488302ad6e9e4df1a/MauiAppCompatActivity
	i32 u0xc8f71d8d, ; 905 => androidx/core/graphics/Insets
	i32 u0xc9666c22, ; 906 => androidx/core/util/Consumer
	i32 u0xc971f3df, ; 907 => android/text/Editable
	i32 u0xc9df47c6, ; 908 => androidx/core/content/pm/PackageInfoCompat
	i32 u0xc9fc6f20, ; 909 => android/view/View$OnFocusChangeListener
	i32 u0xcabc363c, ; 910 => android/view/ScaleGestureDetector$SimpleOnScaleGestureListener
	i32 u0xcb2b39d0, ; 911 => android/webkit/WebMessage
	i32 u0xcb379d37, ; 912 => javax/net/ssl/HttpsURLConnection
	i32 u0xcb4acc01, ; 913 => androidx/lifecycle/viewmodel/CreationExtras
	i32 u0xcbab6a1c, ; 914 => android/view/View$OnScrollChangeListener
	i32 u0xcbe2e8d7, ; 915 => crc6452ffdc5b34af3a0f/MauiMaterialContextThemeWrapper
	i32 u0xcbf0502f, ; 916 => com/google/android/material/tabs/TabLayout$Tab
	i32 u0xcc0df96f, ; 917 => java/lang/Number
	i32 u0xcc7ee4cc, ; 918 => android/content/SharedPreferences
	i32 u0xcd3884d5, ; 919 => mono/androidx/appcompat/app/ActionBar_OnMenuVisibilityListenerImplementor
	i32 u0xcdfbae9f, ; 920 => android/view/accessibility/AccessibilityWindowInfo
	i32 u0xcf7e6cf6, ; 921 => androidx/viewpager2/widget/ViewPager2$OnPageChangeCallback
	i32 u0xcf92bc3a, ; 922 => crc645d80431ce5f73f11/GroupableItemsViewAdapter_2
	i32 u0xd01ded62, ; 923 => androidx/appcompat/app/AppCompatDialog
	i32 u0xd07999b7, ; 924 => android/graphics/Paint$FontMetricsInt
	i32 u0xd0850756, ; 925 => crc645d80431ce5f73f11/EndSnapHelper
	i32 u0xd0967088, ; 926 => crc645d80431ce5f73f11/EndSingleSnapHelper
	i32 u0xd0c6fce3, ; 927 => mono/android/view/View_OnScrollChangeListenerImplementor
	i32 u0xd0daecfc, ; 928 => com/google/android/material/bottomnavigation/BottomNavigationItemView
	i32 u0xd0ec7a4c, ; 929 => com/google/crypto/tink/shaded/protobuf/Internal$LongList
	i32 u0xd1081e48, ; 930 => com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$GeneratedExtension
	i32 u0xd191832f, ; 931 => java/util/function/IntConsumer
	i32 u0xd1cde4e5, ; 932 => java/net/URLConnection
	i32 u0xd1e48dd6, ; 933 => androidx/core/view/ViewCompat
	i32 u0xd2725f3e, ; 934 => androidx/activity/result/PickVisualMediaRequest
	i32 u0xd2846cb7, ; 935 => crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer_WindowsListener
	i32 u0xd28ff81d, ; 936 => android/text/style/WrapTogetherSpan
	i32 u0xd2d86a5e, ; 937 => android/graphics/Paint$Cap
	i32 u0xd31e7330, ; 938 => com/google/android/material/tabs/TabLayoutMediator
	i32 u0xd362931d, ; 939 => android/text/TextDirectionHeuristic
	i32 u0xd3b11951, ; 940 => crc645d80431ce5f73f11/SimpleViewHolder
	i32 u0xd410d357, ; 941 => java/util/concurrent/Future$State
	i32 u0xd4128768, ; 942 => android/util/SizeF
	i32 u0xd43e92b6, ; 943 => androidx/core/view/ViewPropertyAnimatorUpdateListener
	i32 u0xd4dd51a8, ; 944 => androidx/appcompat/view/menu/MenuBuilder
	i32 u0xd4f35a51, ; 945 => com/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener
	i32 u0xd4f8858a, ; 946 => crc6452ffdc5b34af3a0f/MauiWindowInsetListener
	i32 u0xd52920d3, ; 947 => android/runtime/JavaProxyThrowable
	i32 u0xd5c43ed3, ; 948 => crc640ec207abc449b2ca/ShellItemRendererBase
	i32 u0xd66fd9dd, ; 949 => android/widget/AbsListView
	i32 u0xd6b37f87, ; 950 => crc645d80431ce5f73f11/EmptyViewAdapter
	i32 u0xd70d7c57, ; 951 => androidx/recyclerview/widget/RecyclerView$State
	i32 u0xd72952f7, ; 952 => android/os/CancellationSignal
	i32 u0xd7344cdb, ; 953 => java/security/KeyStoreException
	i32 u0xd7432b3d, ; 954 => kotlinx/serialization/encoding/CompositeDecoder
	i32 u0xd74ff3a1, ; 955 => androidx/navigation/fragment/FragmentNavigator$Destination
	i32 u0xd76cff7f, ; 956 => androidx/appcompat/app/ActionBar$Tab
	i32 u0xd7c5fed1, ; 957 => java/util/function/ToIntFunction
	i32 u0xd7d31db6, ; 958 => androidx/appcompat/app/ActionBar$TabListener
	i32 u0xd89e92c7, ; 959 => android/graphics/drawable/AnimationDrawable
	i32 u0xd8e726a8, ; 960 => kotlinx/coroutines/flow/FlowCollector
	i32 u0xd9a7e440, ; 961 => crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer_LongPressGestureListener
	i32 u0xda3a2e42, ; 962 => crc64e1fb321c08285b90/ViewRenderer
	i32 u0xda7f484d, ; 963 => android/view/LayoutInflater
	i32 u0xda867062, ; 964 => java/lang/String
	i32 u0xda91fa6b, ; 965 => androidx/recyclerview/widget/RecyclerView$Adapter
	i32 u0xda9e431c, ; 966 => androidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup
	i32 u0xdab17055, ; 967 => java/net/InetSocketAddress
	i32 u0xdaf44ffb, ; 968 => android/view/accessibility/AccessibilityEvent
	i32 u0xdb1ab932, ; 969 => crc643f2b18b2570eaa5a/PlatformGraphicsView
	i32 u0xdb5c1df3, ; 970 => androidx/activity/ComponentDialog
	i32 u0xdb8b0f9a, ; 971 => mono/android/runtime/JavaObject
	i32 u0xdb9674ba, ; 972 => android/view/ActionProvider
	i32 u0xdbe1e516, ; 973 => androidx/lifecycle/ViewModel
	i32 u0xdc37ab30, ; 974 => mono/androidx/activity/contextaware/OnContextAvailableListenerImplementor
	i32 u0xdc76bd11, ; 975 => android/text/SpannableStringBuilder
	i32 u0xdc9dd54d, ; 976 => android/graphics/Paint$Style
	i32 u0xdcab8f7d, ; 977 => java/lang/Double
	i32 u0xdcd8956d, ; 978 => kotlin/reflect/KAnnotatedElement
	i32 u0xdd3973f2, ; 979 => android/text/style/MetricAffectingSpan
	i32 u0xdd7b8a2d, ; 980 => android/os/Build$VERSION
	i32 u0xddcb4d38, ; 981 => android/text/NoCopySpan
	i32 u0xdde616ce, ; 982 => javax/net/SocketFactory
	i32 u0xdde79766, ; 983 => android/text/method/NumberKeyListener
	i32 u0xde103843, ; 984 => crc640ec207abc449b2ca/ShellSectionRenderer
	i32 u0xde20a2a0, ; 985 => java/net/ProtocolException
	i32 u0xdecff86c, ; 986 => android/webkit/WebChromeClient
	i32 u0xdf443a44, ; 987 => android/view/Choreographer
	i32 u0xdfb71e99, ; 988 => android/text/style/TypefaceSpan
	i32 u0xe01bf9a2, ; 989 => android/graphics/Bitmap
	i32 u0xe0237554, ; 990 => androidx/drawerlayout/widget/DrawerLayout$DrawerListener
	i32 u0xe03d126e, ; 991 => androidx/activity/OnBackPressedDispatcher
	i32 u0xe057d7d6, ; 992 => android/view/Window
	i32 u0xe07911cd, ; 993 => androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia
	i32 u0xe105a023, ; 994 => androidx/core/view/WindowInsetsControllerCompat
	i32 u0xe1996344, ; 995 => androidx/customview/widget/Openable
	i32 u0xe1f6cebd, ; 996 => java/security/spec/KeySpec
	i32 u0xe266d3e7, ; 997 => com/google/crypto/tink/shaded/protobuf/CodedOutputStream
	i32 u0xe32a2fba, ; 998 => android/content/res/TypedArray
	i32 u0xe3e4c8e2, ; 999 => android/net/Uri
	i32 u0xe414eff2, ; 1000 => android/graphics/drawable/DrawableWrapper
	i32 u0xe42c024c, ; 1001 => crc640ec207abc449b2ca/RecyclerViewContainer
	i32 u0xe42c4bfa, ; 1002 => android/widget/TextView$BufferType
	i32 u0xe51d476f, ; 1003 => mono/com/google/android/material/navigation/NavigationBarView_OnItemSelectedListenerImplementor
	i32 u0xe5221abb, ; 1004 => android/graphics/Path$FillType
	i32 u0xe57e2b32, ; 1005 => androidx/navigation/fragment/NavHostFragment
	i32 u0xe5cb91a7, ; 1006 => androidx/appcompat/view/ActionMode
	i32 u0xe6087a1c, ; 1007 => androidx/viewpager2/adapter/FragmentViewHolder
	i32 u0xe6870f3e, ; 1008 => crc6452ffdc5b34af3a0f/AccessibilityDelegateCompatWrapper
	i32 u0xe6cf0c89, ; 1009 => android/view/animation/BaseInterpolator
	i32 u0xe6d2683b, ; 1010 => com/google/android/material/navigation/NavigationBarView
	i32 u0xe6d69f7f, ; 1011 => android/graphics/ColorFilter
	i32 u0xe727a76c, ; 1012 => androidx/activity/BackEventCompat
	i32 u0xe72ab8f6, ; 1013 => crc64ba438d8f48cf7e75/ActivityResultCallback_1
	i32 u0xe76b5314, ; 1014 => java/lang/Class
	i32 u0xe7825e60, ; 1015 => android/webkit/WebView
	i32 u0xe78ae646, ; 1016 => android/text/Html
	i32 u0xe7befe90, ; 1017 => com/google/android/material/appbar/MaterialToolbar
	i32 u0xe82f7a1f, ; 1018 => androidx/core/app/SharedElementCallback
	i32 u0xe83ca42e, ; 1019 => android/widget/ImageView
	i32 u0xe87a4841, ; 1020 => android/graphics/Typeface
	i32 u0xe87e252b, ; 1021 => java/io/InputStream
	i32 u0xe8915163, ; 1022 => android/text/InputFilter
	i32 u0xe8d164a8, ; 1023 => android/webkit/ValueCallback
	i32 u0xe8f04dff, ; 1024 => crc645d80431ce5f73f11/SelectableItemsViewAdapter_2
	i32 u0xe9334697, ; 1025 => java/security/KeyStore
	i32 u0xe95013a9, ; 1026 => kotlin/coroutines/CoroutineContext
	i32 u0xe9a2c576, ; 1027 => android/view/ContextMenu
	i32 u0xe9b78989, ; 1028 => com/google/crypto/tink/shaded/protobuf/ExtensionLite
	i32 u0xe9c6b9e0, ; 1029 => com/google/android/material/bottomsheet/BottomSheetBehavior
	i32 u0xe9caaadd, ; 1030 => androidx/fragment/app/Fragment$SavedState
	i32 u0xe9ce42bc, ; 1031 => android/text/method/MetaKeyKeyListener
	i32 u0xe9d56f43, ; 1032 => kotlin/reflect/KVisibility
	i32 u0xe9e19344, ; 1033 => kotlinx/serialization/descriptors/SerialKind
	i32 u0xea05a91d, ; 1034 => android/app/TimePickerDialog$OnTimeSetListener
	i32 u0xea502245, ; 1035 => mono/android/content/DialogInterface_OnClickListenerImplementor
	i32 u0xea708f4b, ; 1036 => android/graphics/Rect
	i32 u0xeabcef18, ; 1037 => androidx/appcompat/widget/AppCompatCheckBox
	i32 u0xeb026181, ; 1038 => android/graphics/Region
	i32 u0xeb10d94d, ; 1039 => android/content/pm/ShortcutManager
	i32 u0xeb158b93, ; 1040 => crc64338477404e88479c/GenericAnimatorListener
	i32 u0xeb5d161a, ; 1041 => crc6452ffdc5b34af3a0f/NavigationViewFragment
	i32 u0xeb8ea4ba, ; 1042 => androidx/collection/SparseArrayCompat
	i32 u0xec9bfbc3, ; 1043 => androidx/core/widget/TextViewCompat
	i32 u0xeca128e8, ; 1044 => mono/android/runtime/InputStreamAdapter
	i32 u0xecc6b393, ; 1045 => crc640a8d9a12ddbf2cf2/BatteryBroadcastReceiver
	i32 u0xecc755a5, ; 1046 => android/graphics/BitmapShader
	i32 u0xecedb4bd, ; 1047 => javax/net/ssl/SSLSocketFactory
	i32 u0xecf5fbb6, ; 1048 => android/security/keystore/KeyGenParameterSpec
	i32 u0xed80a856, ; 1049 => crc645d80431ce5f73f11/CarouselSpacingItemDecoration
	i32 u0xee05559f, ; 1050 => android/content/ContextWrapper
	i32 u0xee250f69, ; 1051 => android/graphics/Canvas
	i32 u0xee5d2309, ; 1052 => [Z
	i32 u0xef0b5e8e, ; 1053 => kotlinx/serialization/encoding/CompositeDecoder$Companion
	i32 u0xef1f5801, ; 1054 => com/google/android/material/imageview/ShapeableImageView
	i32 u0xef769ed3, ; 1055 => crc6452ffdc5b34af3a0f/StepperHandlerManager_StepperListener
	i32 u0xefa10a0f, ; 1056 => java/lang/Error
	i32 u0xefa62f24, ; 1057 => android/graphics/drawable/DrawableContainer
	i32 u0xefd00308, ; 1058 => android/graphics/drawable/StateListDrawable
	i32 u0xeff867cf, ; 1059 => androidx/core/view/PointerIconCompat
	i32 u0xf02ee875, ; 1060 => android/widget/FilterQueryProvider
	i32 u0xf03f31cc, ; 1061 => android/app/Dialog
	i32 u0xf043ce43, ; 1062 => android/view/animation/Interpolator
	i32 u0xf079578a, ; 1063 => crc6452ffdc5b34af3a0f/MauiMaterialButton
	i32 u0xf08cdcbf, ; 1064 => android/view/View$OnDragListener
	i32 u0xf0afa21d, ; 1065 => android/text/style/UnderlineSpan
	i32 u0xf0d0d93a, ; 1066 => android/graphics/drawable/RippleDrawable
	i32 u0xf0f59ec7, ; 1067 => androidx/recyclerview/widget/GridLayoutManager
	i32 u0xf124220b, ; 1068 => crc64f728827fec74e9c3/TapWindowTracker_GestureListener
	i32 u0xf18125ef, ; 1069 => android/content/Context
	i32 u0xf1cbf0e8, ; 1070 => java/lang/NoClassDefFoundError
	i32 u0xf1e6d542, ; 1071 => android/view/GestureDetector
	i32 u0xf1f6dcd8, ; 1072 => androidx/security/crypto/EncryptedSharedPreferences$PrefValueEncryptionScheme
	i32 u0xf2047d70, ; 1073 => android/view/WindowInsetsAnimation
	i32 u0xf22ceb61, ; 1074 => crc64e1fb321c08285b90/TextCellRenderer_TextCellView
	i32 u0xf25e2260, ; 1075 => android/util/SparseArray
	i32 u0xf2652bfd, ; 1076 => com/google/android/material/shape/ShapePath
	i32 u0xf358152c, ; 1077 => androidx/fragment/app/FragmentHostCallback
	i32 u0xf39a9cec, ; 1078 => kotlinx/serialization/encoding/Decoder
	i32 u0xf3a294c2, ; 1079 => mono/android/view/View_OnTouchListenerImplementor
	i32 u0xf3aa8320, ; 1080 => java/io/Reader
	i32 u0xf3c0315d, ; 1081 => java/nio/Buffer
	i32 u0xf4107582, ; 1082 => androidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments
	i32 u0xf4274bcc, ; 1083 => crc6452ffdc5b34af3a0f/MauiHorizontalScrollView
	i32 u0xf44428b7, ; 1084 => mono/android/view/View_OnClickListenerImplementor
	i32 u0xf452419a, ; 1085 => androidx/core/view/DisplayCutoutCompat
	i32 u0xf475d75a, ; 1086 => java/io/Writer
	i32 u0xf47dc196, ; 1087 => androidx/viewpager/widget/PagerAdapter
	i32 u0xf49449ce, ; 1088 => crc64338477404e88479c/ToolbarExtensions_ToolbarTitleIconImageView
	i32 u0xf4a27a51, ; 1089 => android/text/TextUtils$TruncateAt
	i32 u0xf52720c7, ; 1090 => androidx/loader/content/Loader$OnLoadCanceledListener
	i32 u0xf547c14c, ; 1091 => crc6452ffdc5b34af3a0f/MauiSwipeRefreshLayout
	i32 u0xf55ec28f, ; 1092 => androidx/lifecycle/LifecycleObserver
	i32 u0xf57e1eb2, ; 1093 => androidx/navigation/ui/AppBarConfiguration$Builder
	i32 u0xf58061a4, ; 1094 => androidx/viewpager/widget/ViewPager$OnPageChangeListener
	i32 u0xf58117fa, ; 1095 => android/os/Looper
	i32 u0xf5dc7486, ; 1096 => androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$VisualMediaType
	i32 u0xf60116c5, ; 1097 => mono/android/widget/AdapterView_OnItemClickListenerImplementor
	i32 u0xf60f9453, ; 1098 => crc64e1fb321c08285b90/VisualElementRenderer_1
	i32 u0xf6203711, ; 1099 => com/google/android/material/internal/StaticLayoutBuilderConfigurer
	i32 u0xf639ab34, ; 1100 => java/security/KeyFactory
	i32 u0xf6740dbf, ; 1101 => mono/com/google/android/material/checkbox/MaterialCheckBox_OnErrorChangedListenerImplementor
	i32 u0xf69aa6ed, ; 1102 => android/content/pm/ShortcutInfo$Builder
	i32 u0xf6b37d7c, ; 1103 => androidx/loader/app/LoaderManager$LoaderCallbacks
	i32 u0xf6e67f48, ; 1104 => androidx/appcompat/widget/LinearLayoutCompat$LayoutParams
	i32 u0xf700684c, ; 1105 => crc6452ffdc5b34af3a0f/MauiWebViewClient
	i32 u0xf74645b8, ; 1106 => androidx/core/app/ComponentActivity
	i32 u0xf74684cd, ; 1107 => javax/net/ssl/TrustManagerFactory
	i32 u0xf7d32035, ; 1108 => java/io/IOException
	i32 u0xf8073d4a, ; 1109 => java/lang/Void
	i32 u0xf84f3f3a, ; 1110 => crc64e53d2f592022988e/ConnectivityBroadcastReceiver
	i32 u0xf852a5d2, ; 1111 => android/text/TextWatcher
	i32 u0xf86409d3, ; 1112 => androidx/activity/result/contract/ActivityResultContract$SynchronousResult
	i32 u0xf92c79b2, ; 1113 => androidx/appcompat/app/AlertDialog
	i32 u0xf9685ba7, ; 1114 => crc640ec207abc449b2ca/ShellContentFragment
	i32 u0xf9b2e85b, ; 1115 => com/google/crypto/tink/shaded/protobuf/Internal$IntList
	i32 u0xf9dfcc6c, ; 1116 => androidx/core/graphics/ColorUtils
	i32 u0xfa10306a, ; 1117 => android/graphics/Region$Op
	i32 u0xfa586deb, ; 1118 => crc6452ffdc5b34af3a0f/FragmentManagerExtensions_CallBacks
	i32 u0xfa8c5be5, ; 1119 => android/graphics/Bitmap$CompressFormat
	i32 u0xfae621e1, ; 1120 => com/google/android/material/bottomnavigation/BottomNavigationView
	i32 u0xfaf49b49, ; 1121 => com/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemReselectedListener
	i32 u0xfb076c6c, ; 1122 => android/view/ScaleGestureDetector$OnScaleGestureListener
	i32 u0xfb88098a, ; 1123 => androidx/recyclerview/widget/RecyclerView$ItemAnimator
	i32 u0xfbbdc5a1, ; 1124 => android/text/style/StrikethroughSpan
	i32 u0xfbca2191, ; 1125 => mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor
	i32 u0xfc49ff4f, ; 1126 => java/util/HashSet
	i32 u0xfc81a960, ; 1127 => android/view/ViewTreeObserver$OnGlobalLayoutListener
	i32 u0xfc874966, ; 1128 => android/os/Parcelable
	i32 u0xfc916214, ; 1129 => android/view/MenuItem$OnMenuItemClickListener
	i32 u0xfd3fb630, ; 1130 => android/view/Menu
	i32 u0xfd57cb03, ; 1131 => android/text/style/BackgroundColorSpan
	i32 u0xfdc9e96c, ; 1132 => crc6452ffdc5b34af3a0f/MauiTextView
	i32 u0xfdf8e515, ; 1133 => java/util/function/ToDoubleFunction
	i32 u0xfe67d036, ; 1134 => androidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks
	i32 u0xfe6ffb84, ; 1135 => kotlin/reflect/KClass
	i32 u0xfe732058, ; 1136 => java/nio/charset/Charset
	i32 u0xfe943b89, ; 1137 => android/graphics/PorterDuff
	i32 u0xfe9cf08d, ; 1138 => com/google/crypto/tink/shaded/protobuf/AbstractMessageLite
	i32 u0xfeae1439, ; 1139 => androidx/lifecycle/ViewModelProvider$Factory
	i32 u0xfec117ab, ; 1140 => androidx/core/view/accessibility/AccessibilityNodeInfoCompat
	i32 u0xfed8b694, ; 1141 => crc64338477404e88479c/GenericGlobalLayoutListener
	i32 u0xfef5d29f, ; 1142 => java/io/Closeable
	i32 u0xff0b9725, ; 1143 => android/widget/CompoundButton$OnCheckedChangeListener
	i32 u0xff224fc2, ; 1144 => kotlin/reflect/KTypeParameter
	i32 u0xff409a35, ; 1145 => com/microsoft/maui/MauiViewGroup
	i32 u0xff6b77f6, ; 1146 => androidx/core/view/accessibility/AccessibilityNodeProviderCompat
	i32 u0xff705398, ; 1147 => androidx/viewpager2/adapter/FragmentStateAdapter$FragmentTransactionCallback
	i32 u0xffc00b84, ; 1148 => com/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemSelectedListener
	i32 u0xffedbe25 ; 1149 => com/google/crypto/tink/shaded/protobuf/ByteOutput
], align 4

@module0_managed_to_java = internal dso_local constant [19 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 1012; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 159; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 970; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 880; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 36; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 991; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 294; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 748; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 633; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 934; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 48; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 1112; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200001f, ; uint32_t type_token_id
		i32 37; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000020, ; uint32_t type_token_id
		i32 702; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000021, ; uint32_t type_token_id
		i32 993; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000022, ; uint32_t type_token_id
		i32 458; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000024, ; uint32_t type_token_id
		i32 1096; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000026, ; uint32_t type_token_id
		i32 45; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 974; uint32_t java_map_index
	} ; 18
], align 4

@module0_managed_to_java_duplicates = internal dso_local constant [8 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 36; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 294; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 748; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 633; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 48; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000023, ; uint32_t type_token_id
		i32 458; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000025, ; uint32_t type_token_id
		i32 1096; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000027, ; uint32_t type_token_id
		i32 45; uint32_t java_map_index
	} ; 7
], align 4

@module1_managed_to_java = internal dso_local constant [68 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000041, ; uint32_t type_token_id
		i32 767; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000042, ; uint32_t type_token_id
		i32 533; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000043, ; uint32_t type_token_id
		i32 816; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000045, ; uint32_t type_token_id
		i32 157; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 260; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 858; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 22; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 31; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 1076; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 200; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 1054; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 541; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 747; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 619; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 553; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 202; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 517; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000058, ; uint32_t type_token_id
		i32 1101; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 487; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 57; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 52; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000066, ; uint32_t type_token_id
		i32 1029; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000067, ; uint32_t type_token_id
		i32 824; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000069, ; uint32_t type_token_id
		i32 534; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 499; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 1010; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 128; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000070, ; uint32_t type_token_id
		i32 662; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x02000071, ; uint32_t type_token_id
		i32 330; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x02000073, ; uint32_t type_token_id
		i32 1003; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x02000079, ; uint32_t type_token_id
		i32 222; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 875; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 240; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 713; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000080, ; uint32_t type_token_id
		i32 891; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000083, ; uint32_t type_token_id
		i32 290; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000087, ; uint32_t type_token_id
		i32 589; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x02000088, ; uint32_t type_token_id
		i32 282; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x02000089, ; uint32_t type_token_id
		i32 593; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 317; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x0200008f, ; uint32_t type_token_id
		i32 688; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x02000091, ; uint32_t type_token_id
		i32 916; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x02000099, ; uint32_t type_token_id
		i32 938; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 388; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x0200009c, ; uint32_t type_token_id
		i32 1099; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x0200009e, ; uint32_t type_token_id
		i32 179; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x0200009f, ; uint32_t type_token_id
		i32 928; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x020000a0, ; uint32_t type_token_id
		i32 308; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 1120; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x020000a2, ; uint32_t type_token_id
		i32 1121; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x020000a4, ; uint32_t type_token_id
		i32 1148; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x020000a6, ; uint32_t type_token_id
		i32 95; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x020000a7, ; uint32_t type_token_id
		i32 247; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x020000a9, ; uint32_t type_token_id
		i32 585; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x020000aa, ; uint32_t type_token_id
		i32 433; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x020000ab, ; uint32_t type_token_id
		i32 353; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x020000ad, ; uint32_t type_token_id
		i32 497; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x020000ae, ; uint32_t type_token_id
		i32 665; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x020000b0, ; uint32_t type_token_id
		i32 78; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x020000b1, ; uint32_t type_token_id
		i32 470; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x020000b4, ; uint32_t type_token_id
		i32 527; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x020000b5, ; uint32_t type_token_id
		i32 945; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 562; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x020000b9, ; uint32_t type_token_id
		i32 66; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x020000bf, ; uint32_t type_token_id
		i32 341; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x020000c1, ; uint32_t type_token_id
		i32 680; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x020000c3, ; uint32_t type_token_id
		i32 1017; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020000c4, ; uint32_t type_token_id
		i32 627; uint32_t java_map_index
	} ; 67
], align 4

@module1_managed_to_java_duplicates = internal dso_local constant [25 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 816; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 31; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 553; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 517; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 57; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000068, ; uint32_t type_token_id
		i32 824; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 128; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000072, ; uint32_t type_token_id
		i32 330; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 222; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200007c, ; uint32_t type_token_id
		i32 875; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200007e, ; uint32_t type_token_id
		i32 1010; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000081, ; uint32_t type_token_id
		i32 891; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 593; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000090, ; uint32_t type_token_id
		i32 688; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200009b, ; uint32_t type_token_id
		i32 388; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200009d, ; uint32_t type_token_id
		i32 1099; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x020000a3, ; uint32_t type_token_id
		i32 1121; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x020000a5, ; uint32_t type_token_id
		i32 1148; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x020000a8, ; uint32_t type_token_id
		i32 247; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x020000ac, ; uint32_t type_token_id
		i32 353; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000af, ; uint32_t type_token_id
		i32 665; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000b2, ; uint32_t type_token_id
		i32 470; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x020000b6, ; uint32_t type_token_id
		i32 945; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020000c0, ; uint32_t type_token_id
		i32 341; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020000c2, ; uint32_t type_token_id
		i32 680; uint32_t java_map_index
	} ; 24
], align 4

@module2_managed_to_java = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 358; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 955; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 1005; uint32_t java_map_index
	} ; 2
], align 4

@module3_managed_to_java = internal dso_local constant [71 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200003d, ; uint32_t type_token_id
		i32 906; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 895; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000041, ; uint32_t type_token_id
		i32 367; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000042, ; uint32_t type_token_id
		i32 354; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000043, ; uint32_t type_token_id
		i32 214; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000045, ; uint32_t type_token_id
		i32 1116; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 905; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 717; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 254; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 229; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 908; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 606; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 1106; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 716; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 1018; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 186; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 331; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000053, ; uint32_t type_token_id
		i32 715; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 746; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000057, ; uint32_t type_token_id
		i32 192; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 217; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 1043; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 394; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 772; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 607; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 371; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x02000063, ; uint32_t type_token_id
		i32 472; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000066, ; uint32_t type_token_id
		i32 230; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x0200006d, ; uint32_t type_token_id
		i32 800; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 1085; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 344; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x02000071, ; uint32_t type_token_id
		i32 188; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x02000073, ; uint32_t type_token_id
		i32 285; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x02000075, ; uint32_t type_token_id
		i32 685; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000077, ; uint32_t type_token_id
		i32 299; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000079, ; uint32_t type_token_id
		i32 943; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 484; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 683; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x0200007e, ; uint32_t type_token_id
		i32 615; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x02000080, ; uint32_t type_token_id
		i32 1059; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x02000081, ; uint32_t type_token_id
		i32 885; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x02000082, ; uint32_t type_token_id
		i32 933; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x02000083, ; uint32_t type_token_id
		i32 542; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x02000085, ; uint32_t type_token_id
		i32 414; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x02000086, ; uint32_t type_token_id
		i32 239; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x02000087, ; uint32_t type_token_id
		i32 899; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x02000088, ; uint32_t type_token_id
		i32 92; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x02000089, ; uint32_t type_token_id
		i32 817; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 799; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x0200008b, ; uint32_t type_token_id
		i32 209; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x0200008d, ; uint32_t type_token_id
		i32 675; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 18; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x0200008f, ; uint32_t type_token_id
		i32 733; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x02000090, ; uint32_t type_token_id
		i32 407; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x02000091, ; uint32_t type_token_id
		i32 994; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x02000092, ; uint32_t type_token_id
		i32 657; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x02000095, ; uint32_t type_token_id
		i32 1125; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x02000099, ; uint32_t type_token_id
		i32 328; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 233; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x0200009b, ; uint32_t type_token_id
		i32 1140; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x0200009c, ; uint32_t type_token_id
		i32 888; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x0200009d, ; uint32_t type_token_id
		i32 719; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x0200009e, ; uint32_t type_token_id
		i32 431; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x0200009f, ; uint32_t type_token_id
		i32 832; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x020000a0, ; uint32_t type_token_id
		i32 552; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 1146; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x020000a2, ; uint32_t type_token_id
		i32 314; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020000a3, ; uint32_t type_token_id
		i32 1082; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x020000a5, ; uint32_t type_token_id
		i32 169; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x020000a7, ; uint32_t type_token_id
		i32 197; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x020000a8, ; uint32_t type_token_id
		i32 409; uint32_t java_map_index
	} ; 70
], align 4

@module3_managed_to_java_duplicates = internal dso_local constant [22 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 906; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 895; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 214; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 186; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 1018; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 746; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 607; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000064, ; uint32_t type_token_id
		i32 472; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 772; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000070, ; uint32_t type_token_id
		i32 344; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000072, ; uint32_t type_token_id
		i32 188; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000074, ; uint32_t type_token_id
		i32 285; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000076, ; uint32_t type_token_id
		i32 685; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000078, ; uint32_t type_token_id
		i32 299; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 943; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200007c, ; uint32_t type_token_id
		i32 484; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 615; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000084, ; uint32_t type_token_id
		i32 542; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200008c, ; uint32_t type_token_id
		i32 209; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000093, ; uint32_t type_token_id
		i32 657; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000a4, ; uint32_t type_token_id
		i32 1082; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000a6, ; uint32_t type_token_id
		i32 169; uint32_t java_map_index
	} ; 21
], align 4

@module4_managed_to_java = internal dso_local constant [17 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 457; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 494; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 526; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 889; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 63; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 706; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 592; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 453; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 584; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 565; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 72; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 609; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 26; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 854; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000020, ; uint32_t type_token_id
		i32 428; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000021, ; uint32_t type_token_id
		i32 867; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000023, ; uint32_t type_token_id
		i32 393; uint32_t java_map_index
	} ; 16
], align 4

@module4_managed_to_java_duplicates = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 457; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 609; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 72; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200001f, ; uint32_t type_token_id
		i32 854; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000022, ; uint32_t type_token_id
		i32 867; uint32_t java_map_index
	} ; 4
], align 4

@module5_managed_to_java = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 645; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 819; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 158; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 15; uint32_t java_map_index
	} ; 3
], align 4

@module5_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 819; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 158; uint32_t java_map_index
	} ; 1
], align 4

@module6_managed_to_java = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000003, ; uint32_t type_token_id
		i32 298; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 1093; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 336; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 232; uint32_t java_map_index
	} ; 3
], align 4

@module6_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 336; uint32_t java_map_index
	} ; 0
], align 4

@module7_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000079, ; uint32_t type_token_id
		i32 969; uint32_t java_map_index
	} ; 0
], align 4

@module8_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 655; uint32_t java_map_index
	} ; 0
], align 4

@module8_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 655; uint32_t java_map_index
	} ; 0
], align 4

@module9_managed_to_java = internal dso_local constant [9 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 628; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 973; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 516; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 140; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 1139; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 466; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 913; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 419; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 740; uint32_t java_map_index
	} ; 8
], align 4

@module9_managed_to_java_duplicates = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 628; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 973; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 1139; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 419; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 913; uint32_t java_map_index
	} ; 4
], align 4

@module10_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 766; uint32_t java_map_index
	} ; 0
], align 4

@module11_managed_to_java = internal dso_local constant [80 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x020000bc, ; uint32_t type_token_id
		i32 802; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 35; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x020000be, ; uint32_t type_token_id
		i32 103; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x020000e1, ; uint32_t type_token_id
		i32 904; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x020000e2, ; uint32_t type_token_id
		i32 329; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 345; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x020000f0, ; uint32_t type_token_id
		i32 695; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000180, ; uint32_t type_token_id
		i32 697; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000182, ; uint32_t type_token_id
		i32 435; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000184, ; uint32_t type_token_id
		i32 396; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000186, ; uint32_t type_token_id
		i32 1145; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000187, ; uint32_t type_token_id
		i32 812; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000188, ; uint32_t type_token_id
		i32 684; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200018a, ; uint32_t type_token_id
		i32 618; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200018b, ; uint32_t type_token_id
		i32 201; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200018c, ; uint32_t type_token_id
		i32 62; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200018d, ; uint32_t type_token_id
		i32 850; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200018e, ; uint32_t type_token_id
		i32 258; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200018f, ; uint32_t type_token_id
		i32 520; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000190, ; uint32_t type_token_id
		i32 245; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000191, ; uint32_t type_token_id
		i32 143; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000193, ; uint32_t type_token_id
		i32 451; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000198, ; uint32_t type_token_id
		i32 1008; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020001a5, ; uint32_t type_token_id
		i32 634; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020001ab, ; uint32_t type_token_id
		i32 53; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x020001ac, ; uint32_t type_token_id
		i32 671; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x020001b7, ; uint32_t type_token_id
		i32 1118; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x020001c4, ; uint32_t type_token_id
		i32 220; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x020001c6, ; uint32_t type_token_id
		i32 340; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x020001c7, ; uint32_t type_token_id
		i32 690; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x020001c8, ; uint32_t type_token_id
		i32 726; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x020001c9, ; uint32_t type_token_id
		i32 761; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x020001cb, ; uint32_t type_token_id
		i32 518; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x020001cc, ; uint32_t type_token_id
		i32 107; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x020001cd, ; uint32_t type_token_id
		i32 894; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x020001ce, ; uint32_t type_token_id
		i32 707; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x020001cf, ; uint32_t type_token_id
		i32 1063; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x020001d0, ; uint32_t type_token_id
		i32 835; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x020001d1, ; uint32_t type_token_id
		i32 915; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x020001d2, ; uint32_t type_token_id
		i32 496; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x020001d3, ; uint32_t type_token_id
		i32 537; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x020001d4, ; uint32_t type_token_id
		i32 127; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x020001d5, ; uint32_t type_token_id
		i32 448; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x020001d7, ; uint32_t type_token_id
		i32 756; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x020001d9, ; uint32_t type_token_id
		i32 1083; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x020001db, ; uint32_t type_token_id
		i32 173; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x020001dc, ; uint32_t type_token_id
		i32 417; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x020001dd, ; uint32_t type_token_id
		i32 86; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x020001de, ; uint32_t type_token_id
		i32 129; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x020001df, ; uint32_t type_token_id
		i32 1091; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x020001e0, ; uint32_t type_token_id
		i32 1; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x020001e4, ; uint32_t type_token_id
		i32 1132; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x020001e6, ; uint32_t type_token_id
		i32 475; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x020001e7, ; uint32_t type_token_id
		i32 241; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x020001e9, ; uint32_t type_token_id
		i32 611; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x020001ea, ; uint32_t type_token_id
		i32 1105; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x020001ec, ; uint32_t type_token_id
		i32 946; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x020001f0, ; uint32_t type_token_id
		i32 270; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x020001f2, ; uint32_t type_token_id
		i32 216; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x020001f4, ; uint32_t type_token_id
		i32 1041; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x020001f5, ; uint32_t type_token_id
		i32 17; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x020001f7, ; uint32_t type_token_id
		i32 834; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x020001fa, ; uint32_t type_token_id
		i32 410; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x020001fd, ; uint32_t type_token_id
		i32 154; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x0200020d, ; uint32_t type_token_id
		i32 528; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x0200020f, ; uint32_t type_token_id
		i32 1055; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x02000211, ; uint32_t type_token_id
		i32 669; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x02000228, ; uint32_t type_token_id
		i32 653; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x02000229, ; uint32_t type_token_id
		i32 610; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x020002d1, ; uint32_t type_token_id
		i32 743; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x020002d2, ; uint32_t type_token_id
		i32 346; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x020002eb, ; uint32_t type_token_id
		i32 356; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x02000335, ; uint32_t type_token_id
		i32 568; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x0200033a, ; uint32_t type_token_id
		i32 495; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x02000346, ; uint32_t type_token_id
		i32 184; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x0200034d, ; uint32_t type_token_id
		i32 872; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x02000358, ; uint32_t type_token_id
		i32 421; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x02000359, ; uint32_t type_token_id
		i32 735; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x0200035f, ; uint32_t type_token_id
		i32 563; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x020003a4, ; uint32_t type_token_id
		i32 191; uint32_t java_map_index
	} ; 79
], align 4

@module11_managed_to_java_duplicates = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000181, ; uint32_t type_token_id
		i32 697; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000183, ; uint32_t type_token_id
		i32 435; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000185, ; uint32_t type_token_id
		i32 396; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000189, ; uint32_t type_token_id
		i32 684; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000192, ; uint32_t type_token_id
		i32 143; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000194, ; uint32_t type_token_id
		i32 451; uint32_t java_map_index
	} ; 5
], align 4

@module12_managed_to_java = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 183; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 1090; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 85; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 579; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 1103; uint32_t java_map_index
	} ; 4
], align 4

@module12_managed_to_java_duplicates = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 1090; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 85; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 1103; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 579; uint32_t java_map_index
	} ; 3
], align 4

@module13_managed_to_java = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 257; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 251; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 67; uint32_t java_map_index
	} ; 2
], align 4

@module13_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 257; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 251; uint32_t java_map_index
	} ; 1
], align 4

@module14_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 286; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 698; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 116; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 279; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 68; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 754; uint32_t java_map_index
	} ; 5
], align 4

@module14_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 698; uint32_t java_map_index
	} ; 0
], align 4

@module15_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 995; uint32_t java_map_index
	} ; 0
], align 4

@module15_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 995; uint32_t java_map_index
	} ; 0
], align 4

@module16_managed_to_java = internal dso_local constant [30 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000032, ; uint32_t type_token_id
		i32 863; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000033, ; uint32_t type_token_id
		i32 736; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 49; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 357; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000039, ; uint32_t type_token_id
		i32 704; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 94; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200003d, ; uint32_t type_token_id
		i32 1115; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 929; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000041, ; uint32_t type_token_id
		i32 126; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000043, ; uint32_t type_token_id
		i32 1138; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000045, ; uint32_t type_token_id
		i32 1149; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 455; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 485; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 21; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 997; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 1028; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 591; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 724; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 930; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000053, ; uint32_t type_token_id
		i32 758; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 16; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000057, ; uint32_t type_token_id
		i32 603; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000059, ; uint32_t type_token_id
		i32 189; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 654; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 625; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 890; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 64; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 586; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x02000061, ; uint32_t type_token_id
		i32 136; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 406; uint32_t java_map_index
	} ; 29
], align 4

@module16_managed_to_java_duplicates = internal dso_local constant [19 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 736; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000036, ; uint32_t type_token_id
		i32 49; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 357; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 704; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 94; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 1115; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 929; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000042, ; uint32_t type_token_id
		i32 126; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 1138; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 1149; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 455; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 21; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 997; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 1028; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 724; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 16; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000058, ; uint32_t type_token_id
		i32 603; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200005a, ; uint32_t type_token_id
		i32 189; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 625; uint32_t java_map_index
	} ; 18
], align 4

@module17_managed_to_java = internal dso_local constant [108 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000337, ; uint32_t type_token_id
		i32 165; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000338, ; uint32_t type_token_id
		i32 810; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000339, ; uint32_t type_token_id
		i32 234; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200034a, ; uint32_t type_token_id
		i32 582; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200034b, ; uint32_t type_token_id
		i32 1040; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200034c, ; uint32_t type_token_id
		i32 1141; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200034d, ; uint32_t type_token_id
		i32 174; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200034e, ; uint32_t type_token_id
		i32 249; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000351, ; uint32_t type_token_id
		i32 833; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000352, ; uint32_t type_token_id
		i32 638; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000354, ; uint32_t type_token_id
		i32 630; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000355, ; uint32_t type_token_id
		i32 44; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000358, ; uint32_t type_token_id
		i32 305; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200035b, ; uint32_t type_token_id
		i32 387; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000369, ; uint32_t type_token_id
		i32 373; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200036a, ; uint32_t type_token_id
		i32 277; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000378, ; uint32_t type_token_id
		i32 1114; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200037a, ; uint32_t type_token_id
		i32 771; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200037b, ; uint32_t type_token_id
		i32 821; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x0200037c, ; uint32_t type_token_id
		i32 323; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x0200037d, ; uint32_t type_token_id
		i32 87; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x0200037e, ; uint32_t type_token_id
		i32 1001; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x0200037f, ; uint32_t type_token_id
		i32 351; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000380, ; uint32_t type_token_id
		i32 303; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x02000381, ; uint32_t type_token_id
		i32 674; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x02000382, ; uint32_t type_token_id
		i32 871; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x02000383, ; uint32_t type_token_id
		i32 948; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000384, ; uint32_t type_token_id
		i32 531; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x02000385, ; uint32_t type_token_id
		i32 679; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x02000386, ; uint32_t type_token_id
		i32 828; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x02000387, ; uint32_t type_token_id
		i32 984; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x0200038a, ; uint32_t type_token_id
		i32 392; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x02000394, ; uint32_t type_token_id
		i32 830; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x02000395, ; uint32_t type_token_id
		i32 950; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000396, ; uint32_t type_token_id
		i32 922; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000397, ; uint32_t type_token_id
		i32 194; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000398, ; uint32_t type_token_id
		i32 902; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x02000399, ; uint32_t type_token_id
		i32 1024; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x0200039a, ; uint32_t type_token_id
		i32 207; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x0200039b, ; uint32_t type_token_id
		i32 1049; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x0200039d, ; uint32_t type_token_id
		i32 838; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x0200039e, ; uint32_t type_token_id
		i32 813; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x0200039f, ; uint32_t type_token_id
		i32 228; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x020003a3, ; uint32_t type_token_id
		i32 837; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x020003af, ; uint32_t type_token_id
		i32 788; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x020003b0, ; uint32_t type_token_id
		i32 478; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x020003b1, ; uint32_t type_token_id
		i32 84; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x020003b3, ; uint32_t type_token_id
		i32 381; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x020003b4, ; uint32_t type_token_id
		i32 764; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x020003b5, ; uint32_t type_token_id
		i32 798; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x020003b6, ; uint32_t type_token_id
		i32 853; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x020003b7, ; uint32_t type_token_id
		i32 940; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x020003b8, ; uint32_t type_token_id
		i32 801; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x020003b9, ; uint32_t type_token_id
		i32 195; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x020003ba, ; uint32_t type_token_id
		i32 881; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x020003bb, ; uint32_t type_token_id
		i32 926; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x020003bc, ; uint32_t type_token_id
		i32 925; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x020003bd, ; uint32_t type_token_id
		i32 132; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x020003be, ; uint32_t type_token_id
		i32 738; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x020003c0, ; uint32_t type_token_id
		i32 162; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x020003c1, ; uint32_t type_token_id
		i32 50; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x020003c2, ; uint32_t type_token_id
		i32 803; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x020003c3, ; uint32_t type_token_id
		i32 444; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x020003c5, ; uint32_t type_token_id
		i32 602; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x020003cd, ; uint32_t type_token_id
		i32 135; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x020003ce, ; uint32_t type_token_id
		i32 962; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x020003cf, ; uint32_t type_token_id
		i32 77; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020003d0, ; uint32_t type_token_id
		i32 1098; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x020003d1, ; uint32_t type_token_id
		i32 508; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x020003d2, ; uint32_t type_token_id
		i32 807; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x020003d5, ; uint32_t type_token_id
		i32 587; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x020003d6, ; uint32_t type_token_id
		i32 661; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x020003d8, ; uint32_t type_token_id
		i32 81; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x020003d9, ; uint32_t type_token_id
		i32 151; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x020003db, ; uint32_t type_token_id
		i32 822; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x020003dc, ; uint32_t type_token_id
		i32 65; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x020003de, ; uint32_t type_token_id
		i32 492; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x020003e2, ; uint32_t type_token_id
		i32 749; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x020003e3, ; uint32_t type_token_id
		i32 309; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x0200049f, ; uint32_t type_token_id
		i32 1068; uint32_t java_map_index
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 u0x0200056f, ; uint32_t type_token_id
		i32 481; uint32_t java_map_index
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 u0x020005f3, ; uint32_t type_token_id
		i32 529; uint32_t java_map_index
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 u0x020005f9, ; uint32_t type_token_id
		i32 1088; uint32_t java_map_index
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 u0x02000606, ; uint32_t type_token_id
		i32 430; uint32_t java_map_index
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 u0x02000611, ; uint32_t type_token_id
		i32 760; uint32_t java_map_index
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 u0x02000613, ; uint32_t type_token_id
		i32 439; uint32_t java_map_index
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 u0x02000614, ; uint32_t type_token_id
		i32 935; uint32_t java_map_index
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 u0x02000615, ; uint32_t type_token_id
		i32 104; uint32_t java_map_index
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 u0x0200061c, ; uint32_t type_token_id
		i32 315; uint32_t java_map_index
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 u0x0200061f, ; uint32_t type_token_id
		i32 673; uint32_t java_map_index
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 u0x02000620, ; uint32_t type_token_id
		i32 325; uint32_t java_map_index
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 u0x02000621, ; uint32_t type_token_id
		i32 38; uint32_t java_map_index
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 u0x02000624, ; uint32_t type_token_id
		i32 656; uint32_t java_map_index
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 u0x02000628, ; uint32_t type_token_id
		i32 59; uint32_t java_map_index
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 u0x02000629, ; uint32_t type_token_id
		i32 46; uint32_t java_map_index
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 u0x02000632, ; uint32_t type_token_id
		i32 642; uint32_t java_map_index
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 u0x02000635, ; uint32_t type_token_id
		i32 404; uint32_t java_map_index
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 u0x02000638, ; uint32_t type_token_id
		i32 90; uint32_t java_map_index
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 u0x0200063e, ; uint32_t type_token_id
		i32 288; uint32_t java_map_index
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 u0x0200063f, ; uint32_t type_token_id
		i32 360; uint32_t java_map_index
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 u0x02000640, ; uint32_t type_token_id
		i32 310; uint32_t java_map_index
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 u0x02000641, ; uint32_t type_token_id
		i32 133; uint32_t java_map_index
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 u0x02000643, ; uint32_t type_token_id
		i32 1074; uint32_t java_map_index
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 u0x02000644, ; uint32_t type_token_id
		i32 809; uint32_t java_map_index
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 u0x020006ab, ; uint32_t type_token_id
		i32 164; uint32_t java_map_index
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 u0x020006ae, ; uint32_t type_token_id
		i32 898; uint32_t java_map_index
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 u0x020006af, ; uint32_t type_token_id
		i32 961; uint32_t java_map_index
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 u0x020006b7, ; uint32_t type_token_id
		i32 672; uint32_t java_map_index
	} ; 107
], align 4

@module18_managed_to_java = internal dso_local constant [55 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000036, ; uint32_t type_token_id
		i32 215; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 187; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 512; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 362; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 856; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 424; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000042, ; uint32_t type_token_id
		i32 311; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000043, ; uint32_t type_token_id
		i32 762; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 1037; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000045, ; uint32_t type_token_id
		i32 693; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 616; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 543; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 100; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 429; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 851; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 1104; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 608; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 122; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 196; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 490; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 14; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 574; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000059, ; uint32_t type_token_id
		i32 206; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x0200005a, ; uint32_t type_token_id
		i32 753; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 840; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 741; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 604; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 1113; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x0200006d, ; uint32_t type_token_id
		i32 530; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 405; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 253; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x02000070, ; uint32_t type_token_id
		i32 500; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x02000071, ; uint32_t type_token_id
		i32 791; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000072, ; uint32_t type_token_id
		i32 806; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000073, ; uint32_t type_token_id
		i32 293; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000076, ; uint32_t type_token_id
		i32 919; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x02000077, ; uint32_t type_token_id
		i32 171; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x02000079, ; uint32_t type_token_id
		i32 956; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 958; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x02000081, ; uint32_t type_token_id
		i32 825; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x02000082, ; uint32_t type_token_id
		i32 248; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x02000084, ; uint32_t type_token_id
		i32 176; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x02000085, ; uint32_t type_token_id
		i32 711; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x02000087, ; uint32_t type_token_id
		i32 923; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x02000088, ; uint32_t type_token_id
		i32 347; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 1006; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x0200008b, ; uint32_t type_token_id
		i32 332; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 944; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x0200008f, ; uint32_t type_token_id
		i32 842; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x02000091, ; uint32_t type_token_id
		i32 403; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x02000093, ; uint32_t type_token_id
		i32 359; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x02000095, ; uint32_t type_token_id
		i32 382; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x02000097, ; uint32_t type_token_id
		i32 841; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x02000098, ; uint32_t type_token_id
		i32 491; uint32_t java_map_index
	} ; 54
], align 4

@module18_managed_to_java_duplicates = internal dso_local constant [19 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 856; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 25; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 490; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 574; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 753; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000074, ; uint32_t type_token_id
		i32 293; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000078, ; uint32_t type_token_id
		i32 171; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200007a, ; uint32_t type_token_id
		i32 956; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200007c, ; uint32_t type_token_id
		i32 958; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000080, ; uint32_t type_token_id
		i32 791; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000083, ; uint32_t type_token_id
		i32 248; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000086, ; uint32_t type_token_id
		i32 711; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000089, ; uint32_t type_token_id
		i32 347; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200008c, ; uint32_t type_token_id
		i32 332; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200008d, ; uint32_t type_token_id
		i32 1006; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000090, ; uint32_t type_token_id
		i32 842; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000092, ; uint32_t type_token_id
		i32 403; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000094, ; uint32_t type_token_id
		i32 359; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000096, ; uint32_t type_token_id
		i32 382; uint32_t java_map_index
	} ; 18
], align 4

@module19_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 425; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 843; uint32_t java_map_index
	} ; 1
], align 4

@module20_managed_to_java = internal dso_local constant [7 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 1087; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 276; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200001f, ; uint32_t type_token_id
		i32 792; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000022, ; uint32_t type_token_id
		i32 88; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000023, ; uint32_t type_token_id
		i32 1094; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000028, ; uint32_t type_token_id
		i32 557; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 238; uint32_t java_map_index
	} ; 6
], align 4

@module20_managed_to_java_duplicates = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 1087; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000020, ; uint32_t type_token_id
		i32 792; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000024, ; uint32_t type_token_id
		i32 1094; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 238; uint32_t java_map_index
	} ; 3
], align 4

@module21_managed_to_java = internal dso_local constant [9 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 866; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000021, ; uint32_t type_token_id
		i32 296; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000023, ; uint32_t type_token_id
		i32 1110; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200003f, ; uint32_t type_token_id
		i32 1013; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 385; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 144; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 583; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 1045; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 326; uint32_t java_map_index
	} ; 8
], align 4

@module22_managed_to_java = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000027, ; uint32_t type_token_id
		i32 333; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000028, ; uint32_t type_token_id
		i32 599; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 820; uint32_t java_map_index
	} ; 2
], align 4

@module22_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 599; uint32_t java_map_index
	} ; 0
], align 4

@module23_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 594; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 519; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 598; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 9; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 1092; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 106; uint32_t java_map_index
	} ; 5
], align 4

@module23_managed_to_java_duplicates = internal dso_local constant [3 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 1092; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 106; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 594; uint32_t java_map_index
	} ; 2
], align 4

@module24_managed_to_java = internal dso_local constant [7 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 884; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 873; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 960; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 300; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 374; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 580; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 243; uint32_t java_map_index
	} ; 6
], align 4

@module24_managed_to_java_duplicates = internal dso_local constant [7 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 884; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 873; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 960; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 300; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 374; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 580; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 243; uint32_t java_map_index
	} ; 6
], align 4

@module25_managed_to_java = internal dso_local constant [10 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 218; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 479; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 624; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000031, ; uint32_t type_token_id
		i32 1053; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000032, ; uint32_t type_token_id
		i32 954; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 667; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000036, ; uint32_t type_token_id
		i32 1078; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 319; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 1033; uint32_t java_map_index
	} ; 9
], align 4

@module25_managed_to_java_duplicates = internal dso_local constant [9 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 218; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200002e, ; uint32_t type_token_id
		i32 479; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 624; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000033, ; uint32_t type_token_id
		i32 954; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 667; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 1078; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000039, ; uint32_t type_token_id
		i32 58; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200003b, ; uint32_t type_token_id
		i32 319; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200003d, ; uint32_t type_token_id
		i32 1033; uint32_t java_map_index
	} ; 8
], align 4

@module26_managed_to_java = internal dso_local constant [6 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000002, ; uint32_t type_token_id
		i32 446; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000003, ; uint32_t type_token_id
		i32 781; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 1072; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 445; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 865; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000007, ; uint32_t type_token_id
		i32 96; uint32_t java_map_index
	} ; 5
], align 4

@module27_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000002, ; uint32_t type_token_id
		i32 369; uint32_t java_map_index
	} ; 0
], align 4

@module28_managed_to_java = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 1042; uint32_t java_map_index
	} ; 0
], align 4

@module29_managed_to_java = internal dso_local constant [41 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 1067; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 966; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 666; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 261; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 868; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000053, ; uint32_t type_token_id
		i32 5; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000054, ; uint32_t type_token_id
		i32 786; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000055, ; uint32_t type_token_id
		i32 897; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000056, ; uint32_t type_token_id
		i32 125; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000058, ; uint32_t type_token_id
		i32 636; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000059, ; uint32_t type_token_id
		i32 646; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200005a, ; uint32_t type_token_id
		i32 965; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 718; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 124; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 660; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000061, ; uint32_t type_token_id
		i32 503; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000062, ; uint32_t type_token_id
		i32 1123; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000063, ; uint32_t type_token_id
		i32 372; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000065, ; uint32_t type_token_id
		i32 779; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000067, ; uint32_t type_token_id
		i32 284; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000069, ; uint32_t type_token_id
		i32 130; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 242; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 870; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 376; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 893; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x02000073, ; uint32_t type_token_id
		i32 235; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x02000074, ; uint32_t type_token_id
		i32 612; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000076, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 687; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x0200007c, ; uint32_t type_token_id
		i32 637; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x0200007e, ; uint32_t type_token_id
		i32 350; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 558; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x02000080, ; uint32_t type_token_id
		i32 365; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x02000083, ; uint32_t type_token_id
		i32 170; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x02000084, ; uint32_t type_token_id
		i32 343; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000085, ; uint32_t type_token_id
		i32 804; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000087, ; uint32_t type_token_id
		i32 951; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x02000088, ; uint32_t type_token_id
		i32 180; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 138; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x02000099, ; uint32_t type_token_id
		i32 114; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 773; uint32_t java_map_index
	} ; 40
], align 4

@module29_managed_to_java_duplicates = internal dso_local constant [21 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 966; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 666; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000052, ; uint32_t type_token_id
		i32 868; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000057, ; uint32_t type_token_id
		i32 125; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 965; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 124; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000060, ; uint32_t type_token_id
		i32 660; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000064, ; uint32_t type_token_id
		i32 372; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000066, ; uint32_t type_token_id
		i32 1123; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000068, ; uint32_t type_token_id
		i32 284; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 242; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200006d, ; uint32_t type_token_id
		i32 130; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000070, ; uint32_t type_token_id
		i32 893; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000075, ; uint32_t type_token_id
		i32 612; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000077, ; uint32_t type_token_id
		i32 20; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 637; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000081, ; uint32_t type_token_id
		i32 365; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000086, ; uint32_t type_token_id
		i32 343; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x02000089, ; uint32_t type_token_id
		i32 180; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x0200008b, ; uint32_t type_token_id
		i32 138; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x0200009b, ; uint32_t type_token_id
		i32 773; uint32_t java_map_index
	} ; 20
], align 4

@module30_managed_to_java = internal dso_local constant [20 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000023, ; uint32_t type_token_id
		i32 514; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000024, ; uint32_t type_token_id
		i32 361; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000025, ; uint32_t type_token_id
		i32 7; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000026, ; uint32_t type_token_id
		i32 1030; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000027, ; uint32_t type_token_id
		i32 182; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 272; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 121; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 1077; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 525; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x0200002e, ; uint32_t type_token_id
		i32 570; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 1134; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000032, ; uint32_t type_token_id
		i32 621; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 47; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000046, ; uint32_t type_token_id
		i32 185; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 605; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 676; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 117; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 896; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 32; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000050, ; uint32_t type_token_id
		i32 785; uint32_t java_map_index
	} ; 19
], align 4

@module30_managed_to_java_duplicates = internal dso_local constant [10 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000028, ; uint32_t type_token_id
		i32 182; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 1077; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 570; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000031, ; uint32_t type_token_id
		i32 1134; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000033, ; uint32_t type_token_id
		i32 621; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000045, ; uint32_t type_token_id
		i32 525; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000047, ; uint32_t type_token_id
		i32 185; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x02000049, ; uint32_t type_token_id
		i32 605; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 117; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000051, ; uint32_t type_token_id
		i32 785; uint32_t java_map_index
	} ; 9
], align 4

@module31_managed_to_java = internal dso_local constant [500 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x020000b3, ; uint32_t type_token_id
		i32 600; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x020000b5, ; uint32_t type_token_id
		i32 668; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 327; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x020000ba, ; uint32_t type_token_id
		i32 75; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x020000bc, ; uint32_t type_token_id
		i32 398; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 982; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x020000bf, ; uint32_t type_token_id
		i32 912; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x020000c1, ; uint32_t type_token_id
		i32 723; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x020000c3, ; uint32_t type_token_id
		i32 366; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x020000c5, ; uint32_t type_token_id
		i32 886; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x020000c7, ; uint32_t type_token_id
		i32 39; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x020000c9, ; uint32_t type_token_id
		i32 225; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x020000cb, ; uint32_t type_token_id
		i32 287; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x020000cc, ; uint32_t type_token_id
		i32 349; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x020000cd, ; uint32_t type_token_id
		i32 1047; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x020000cf, ; uint32_t type_token_id
		i32 1107; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x020000d0, ; uint32_t type_token_id
		i32 98; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x020000d1, ; uint32_t type_token_id
		i32 874; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x020000d2, ; uint32_t type_token_id
		i32 573; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x020000d3, ; uint32_t type_token_id
		i32 55; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000d5, ; uint32_t type_token_id
		i32 670; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000d7, ; uint32_t type_token_id
		i32 76; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x020000d9, ; uint32_t type_token_id
		i32 434; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020000db, ; uint32_t type_token_id
		i32 1023; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020000dd, ; uint32_t type_token_id
		i32 739; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x020000e1, ; uint32_t type_token_id
		i32 34; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x020000e3, ; uint32_t type_token_id
		i32 986; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x020000e4, ; uint32_t type_token_id
		i32 73; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 555; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 911; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x020000e9, ; uint32_t type_token_id
		i32 827; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x020000eb, ; uint32_t type_token_id
		i32 12; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x020000ec, ; uint32_t type_token_id
		i32 677; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x020000ee, ; uint32_t type_token_id
		i32 1015; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 727; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x020000f0, ; uint32_t type_token_id
		i32 559; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x020000f1, ; uint32_t type_token_id
		i32 278; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x020000f3, ; uint32_t type_token_id
		i32 267; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x020000f6, ; uint32_t type_token_id
		i32 231; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x020000f8, ; uint32_t type_token_id
		i32 949; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x020000f9, ; uint32_t type_token_id
		i32 97; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x020000fc, ; uint32_t type_token_id
		i32 547; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x020000fd, ; uint32_t type_token_id
		i32 538; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x02000100, ; uint32_t type_token_id
		i32 1097; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x02000101, ; uint32_t type_token_id
		i32 295; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x02000103, ; uint32_t type_token_id
		i32 521; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x02000106, ; uint32_t type_token_id
		i32 422; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x0200010a, ; uint32_t type_token_id
		i32 703; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x0200010b, ; uint32_t type_token_id
		i32 69; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x0200010c, ; uint32_t type_token_id
		i32 734; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x0200010d, ; uint32_t type_token_id
		i32 1002; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x0200010e, ; uint32_t type_token_id
		i32 289; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x02000111, ; uint32_t type_token_id
		i32 652; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x02000115, ; uint32_t type_token_id
		i32 275; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x02000116, ; uint32_t type_token_id
		i32 571; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x0200011b, ; uint32_t type_token_id
		i32 408; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x0200011c, ; uint32_t type_token_id
		i32 450; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x0200011e, ; uint32_t type_token_id
		i32 454; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x0200011f, ; uint32_t type_token_id
		i32 1143; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x02000122, ; uint32_t type_token_id
		i32 595; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x02000127, ; uint32_t type_token_id
		i32 452; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x02000128, ; uint32_t type_token_id
		i32 262; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x02000129, ; uint32_t type_token_id
		i32 155; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x0200012a, ; uint32_t type_token_id
		i32 338; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x0200012c, ; uint32_t type_token_id
		i32 467; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x0200012d, ; uint32_t type_token_id
		i32 545; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x0200012e, ; uint32_t type_token_id
		i32 250; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x0200012f, ; uint32_t type_token_id
		i32 730; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x02000131, ; uint32_t type_token_id
		i32 348; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x02000133, ; uint32_t type_token_id
		i32 1060; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x02000135, ; uint32_t type_token_id
		i32 8; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x02000137, ; uint32_t type_token_id
		i32 721; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x02000138, ; uint32_t type_token_id
		i32 1019; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x02000139, ; uint32_t type_token_id
		i32 696; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x0200013a, ; uint32_t type_token_id
		i32 150; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x0200013c, ; uint32_t type_token_id
		i32 561; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x0200013e, ; uint32_t type_token_id
		i32 502; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x0200013f, ; uint32_t type_token_id
		i32 386; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x02000140, ; uint32_t type_token_id
		i32 789; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x02000142, ; uint32_t type_token_id
		i32 391; uint32_t java_map_index
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 u0x02000143, ; uint32_t type_token_id
		i32 304; uint32_t java_map_index
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 u0x02000145, ; uint32_t type_token_id
		i32 640; uint32_t java_map_index
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 u0x02000146, ; uint32_t type_token_id
		i32 860; uint32_t java_map_index
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 u0x02000147, ; uint32_t type_token_id
		i32 337; uint32_t java_map_index
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 u0x02000149, ; uint32_t type_token_id
		i32 641; uint32_t java_map_index
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 u0x0200014a, ; uint32_t type_token_id
		i32 549; uint32_t java_map_index
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 u0x0200014d, ; uint32_t type_token_id
		i32 30; uint32_t java_map_index
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 u0x0200014e, ; uint32_t type_token_id
		i32 784; uint32_t java_map_index
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 u0x02000150, ; uint32_t type_token_id
		i32 823; uint32_t java_map_index
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 u0x02000151, ; uint32_t type_token_id
		i32 942; uint32_t java_map_index
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 u0x02000152, ; uint32_t type_token_id
		i32 1075; uint32_t java_map_index
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 u0x02000153, ; uint32_t type_token_id
		i32 110; uint32_t java_map_index
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 u0x02000154, ; uint32_t type_token_id
		i32 649; uint32_t java_map_index
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 u0x02000157, ; uint32_t type_token_id
		i32 501; uint32_t java_map_index
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 u0x02000159, ; uint32_t type_token_id
		i32 1016; uint32_t java_map_index
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 u0x0200015a, ; uint32_t type_token_id
		i32 907; uint32_t java_map_index
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 u0x0200015d, ; uint32_t type_token_id
		i32 43; uint32_t java_map_index
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 u0x02000160, ; uint32_t type_token_id
		i32 271; uint32_t java_map_index
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 u0x02000161, ; uint32_t type_token_id
		i32 1022; uint32_t java_map_index
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 u0x02000163, ; uint32_t type_token_id
		i32 981; uint32_t java_map_index
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 u0x02000166, ; uint32_t type_token_id
		i32 750; uint32_t java_map_index
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 u0x02000169, ; uint32_t type_token_id
		i32 486; uint32_t java_map_index
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 u0x0200016c, ; uint32_t type_token_id
		i32 939; uint32_t java_map_index
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 u0x0200016e, ; uint32_t type_token_id
		i32 1111; uint32_t java_map_index
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 u0x02000171, ; uint32_t type_token_id
		i32 473; uint32_t java_map_index
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 u0x02000172, ; uint32_t type_token_id
		i32 292; uint32_t java_map_index
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 u0x02000174, ; uint32_t type_token_id
		i32 811; uint32_t java_map_index
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 u0x02000176, ; uint32_t type_token_id
		i32 975; uint32_t java_map_index
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 u0x02000178, ; uint32_t type_token_id
		i32 390; uint32_t java_map_index
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 u0x0200017b, ; uint32_t type_token_id
		i32 678; uint32_t java_map_index
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 u0x0200017c, ; uint32_t type_token_id
		i32 301; uint32_t java_map_index
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 u0x0200017d, ; uint32_t type_token_id
		i32 246; uint32_t java_map_index
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 u0x0200017e, ; uint32_t type_token_id
		i32 244; uint32_t java_map_index
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 u0x0200017f, ; uint32_t type_token_id
		i32 1089; uint32_t java_map_index
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 u0x02000180, ; uint32_t type_token_id
		i32 1131; uint32_t java_map_index
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 u0x02000181, ; uint32_t type_token_id
		i32 550; uint32_t java_map_index
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 u0x02000182, ; uint32_t type_token_id
		i32 99; uint32_t java_map_index
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 u0x02000184, ; uint32_t type_token_id
		i32 857; uint32_t java_map_index
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 u0x02000186, ; uint32_t type_token_id
		i32 515; uint32_t java_map_index
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 u0x02000187, ; uint32_t type_token_id
		i32 4; uint32_t java_map_index
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 u0x02000189, ; uint32_t type_token_id
		i32 778; uint32_t java_map_index
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 u0x0200018b, ; uint32_t type_token_id
		i32 936; uint32_t java_map_index
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 u0x0200018d, ; uint32_t type_token_id
		i32 979; uint32_t java_map_index
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 u0x0200018f, ; uint32_t type_token_id
		i32 1124; uint32_t java_map_index
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 u0x02000190, ; uint32_t type_token_id
		i32 318; uint32_t java_map_index
	}, ; 124
	%struct.TypeMapModuleEntry {
		i32 u0x02000191, ; uint32_t type_token_id
		i32 41; uint32_t java_map_index
	}, ; 125
	%struct.TypeMapModuleEntry {
		i32 u0x02000192, ; uint32_t type_token_id
		i32 199; uint32_t java_map_index
	}, ; 126
	%struct.TypeMapModuleEntry {
		i32 u0x02000193, ; uint32_t type_token_id
		i32 988; uint32_t java_map_index
	}, ; 127
	%struct.TypeMapModuleEntry {
		i32 u0x02000194, ; uint32_t type_token_id
		i32 1065; uint32_t java_map_index
	}, ; 128
	%struct.TypeMapModuleEntry {
		i32 u0x02000195, ; uint32_t type_token_id
		i32 255; uint32_t java_map_index
	}, ; 129
	%struct.TypeMapModuleEntry {
		i32 u0x02000197, ; uint32_t type_token_id
		i32 797; uint32_t java_map_index
	}, ; 130
	%struct.TypeMapModuleEntry {
		i32 u0x02000198, ; uint32_t type_token_id
		i32 177; uint32_t java_map_index
	}, ; 131
	%struct.TypeMapModuleEntry {
		i32 u0x0200019a, ; uint32_t type_token_id
		i32 887; uint32_t java_map_index
	}, ; 132
	%struct.TypeMapModuleEntry {
		i32 u0x0200019c, ; uint32_t type_token_id
		i32 1031; uint32_t java_map_index
	}, ; 133
	%struct.TypeMapModuleEntry {
		i32 u0x0200019e, ; uint32_t type_token_id
		i32 983; uint32_t java_map_index
	}, ; 134
	%struct.TypeMapModuleEntry {
		i32 u0x020001a0, ; uint32_t type_token_id
		i32 755; uint32_t java_map_index
	}, ; 135
	%struct.TypeMapModuleEntry {
		i32 u0x020001a1, ; uint32_t type_token_id
		i32 757; uint32_t java_map_index
	}, ; 136
	%struct.TypeMapModuleEntry {
		i32 u0x020001a2, ; uint32_t type_token_id
		i32 1048; uint32_t java_map_index
	}, ; 137
	%struct.TypeMapModuleEntry {
		i32 u0x020001a3, ; uint32_t type_token_id
		i32 826; uint32_t java_map_index
	}, ; 138
	%struct.TypeMapModuleEntry {
		i32 u0x020001a4, ; uint32_t type_token_id
		i32 147; uint32_t java_map_index
	}, ; 139
	%struct.TypeMapModuleEntry {
		i32 u0x020001a5, ; uint32_t type_token_id
		i32 427; uint32_t java_map_index
	}, ; 140
	%struct.TypeMapModuleEntry {
		i32 u0x020001a6, ; uint32_t type_token_id
		i32 368; uint32_t java_map_index
	}, ; 141
	%struct.TypeMapModuleEntry {
		i32 u0x020001a7, ; uint32_t type_token_id
		i32 509; uint32_t java_map_index
	}, ; 142
	%struct.TypeMapModuleEntry {
		i32 u0x020001a8, ; uint32_t type_token_id
		i32 476; uint32_t java_map_index
	}, ; 143
	%struct.TypeMapModuleEntry {
		i32 u0x020001a9, ; uint32_t type_token_id
		i32 759; uint32_t java_map_index
	}, ; 144
	%struct.TypeMapModuleEntry {
		i32 u0x020001aa, ; uint32_t type_token_id
		i32 980; uint32_t java_map_index
	}, ; 145
	%struct.TypeMapModuleEntry {
		i32 u0x020001ac, ; uint32_t type_token_id
		i32 163; uint32_t java_map_index
	}, ; 146
	%struct.TypeMapModuleEntry {
		i32 u0x020001ad, ; uint32_t type_token_id
		i32 952; uint32_t java_map_index
	}, ; 147
	%struct.TypeMapModuleEntry {
		i32 u0x020001ae, ; uint32_t type_token_id
		i32 569; uint32_t java_map_index
	}, ; 148
	%struct.TypeMapModuleEntry {
		i32 u0x020001af, ; uint32_t type_token_id
		i32 210; uint32_t java_map_index
	}, ; 149
	%struct.TypeMapModuleEntry {
		i32 u0x020001b1, ; uint32_t type_token_id
		i32 847; uint32_t java_map_index
	}, ; 150
	%struct.TypeMapModuleEntry {
		i32 u0x020001b2, ; uint32_t type_token_id
		i32 436; uint32_t java_map_index
	}, ; 151
	%struct.TypeMapModuleEntry {
		i32 u0x020001b5, ; uint32_t type_token_id
		i32 468; uint32_t java_map_index
	}, ; 152
	%struct.TypeMapModuleEntry {
		i32 u0x020001b7, ; uint32_t type_token_id
		i32 551; uint32_t java_map_index
	}, ; 153
	%struct.TypeMapModuleEntry {
		i32 u0x020001b9, ; uint32_t type_token_id
		i32 1128; uint32_t java_map_index
	}, ; 154
	%struct.TypeMapModuleEntry {
		i32 u0x020001bb, ; uint32_t type_token_id
		i32 862; uint32_t java_map_index
	}, ; 155
	%struct.TypeMapModuleEntry {
		i32 u0x020001bc, ; uint32_t type_token_id
		i32 1095; uint32_t java_map_index
	}, ; 156
	%struct.TypeMapModuleEntry {
		i32 u0x020001bd, ; uint32_t type_token_id
		i32 139; uint32_t java_map_index
	}, ; 157
	%struct.TypeMapModuleEntry {
		i32 u0x020001c0, ; uint32_t type_token_id
		i32 93; uint32_t java_map_index
	}, ; 158
	%struct.TypeMapModuleEntry {
		i32 u0x020001c1, ; uint32_t type_token_id
		i32 0; uint32_t java_map_index
	}, ; 159
	%struct.TypeMapModuleEntry {
		i32 u0x020001c3, ; uint32_t type_token_id
		i32 699; uint32_t java_map_index
	}, ; 160
	%struct.TypeMapModuleEntry {
		i32 u0x020001c4, ; uint32_t type_token_id
		i32 320; uint32_t java_map_index
	}, ; 161
	%struct.TypeMapModuleEntry {
		i32 u0x020001c5, ; uint32_t type_token_id
		i32 839; uint32_t java_map_index
	}, ; 162
	%struct.TypeMapModuleEntry {
		i32 u0x020001c8, ; uint32_t type_token_id
		i32 281; uint32_t java_map_index
	}, ; 163
	%struct.TypeMapModuleEntry {
		i32 u0x020001c9, ; uint32_t type_token_id
		i32 213; uint32_t java_map_index
	}, ; 164
	%struct.TypeMapModuleEntry {
		i32 u0x020001cf, ; uint32_t type_token_id
		i32 581; uint32_t java_map_index
	}, ; 165
	%struct.TypeMapModuleEntry {
		i32 u0x020001d1, ; uint32_t type_token_id
		i32 108; uint32_t java_map_index
	}, ; 166
	%struct.TypeMapModuleEntry {
		i32 u0x020001d3, ; uint32_t type_token_id
		i32 415; uint32_t java_map_index
	}, ; 167
	%struct.TypeMapModuleEntry {
		i32 u0x020001d4, ; uint32_t type_token_id
		i32 440; uint32_t java_map_index
	}, ; 168
	%struct.TypeMapModuleEntry {
		i32 u0x020001d5, ; uint32_t type_token_id
		i32 831; uint32_t java_map_index
	}, ; 169
	%struct.TypeMapModuleEntry {
		i32 u0x020001d6, ; uint32_t type_token_id
		i32 175; uint32_t java_map_index
	}, ; 170
	%struct.TypeMapModuleEntry {
		i32 u0x020001d7, ; uint32_t type_token_id
		i32 745; uint32_t java_map_index
	}, ; 171
	%struct.TypeMapModuleEntry {
		i32 u0x020001d8, ; uint32_t type_token_id
		i32 383; uint32_t java_map_index
	}, ; 172
	%struct.TypeMapModuleEntry {
		i32 u0x020001dc, ; uint32_t type_token_id
		i32 449; uint32_t java_map_index
	}, ; 173
	%struct.TypeMapModuleEntry {
		i32 u0x020001dd, ; uint32_t type_token_id
		i32 488; uint32_t java_map_index
	}, ; 174
	%struct.TypeMapModuleEntry {
		i32 u0x020001df, ; uint32_t type_token_id
		i32 1084; uint32_t java_map_index
	}, ; 175
	%struct.TypeMapModuleEntry {
		i32 u0x020001e0, ; uint32_t type_token_id
		i32 1064; uint32_t java_map_index
	}, ; 176
	%struct.TypeMapModuleEntry {
		i32 u0x020001e2, ; uint32_t type_token_id
		i32 909; uint32_t java_map_index
	}, ; 177
	%struct.TypeMapModuleEntry {
		i32 u0x020001e5, ; uint32_t type_token_id
		i32 291; uint32_t java_map_index
	}, ; 178
	%struct.TypeMapModuleEntry {
		i32 u0x020001e6, ; uint32_t type_token_id
		i32 400; uint32_t java_map_index
	}, ; 179
	%struct.TypeMapModuleEntry {
		i32 u0x020001e8, ; uint32_t type_token_id
		i32 737; uint32_t java_map_index
	}, ; 180
	%struct.TypeMapModuleEntry {
		i32 u0x020001eb, ; uint32_t type_token_id
		i32 768; uint32_t java_map_index
	}, ; 181
	%struct.TypeMapModuleEntry {
		i32 u0x020001ec, ; uint32_t type_token_id
		i32 644; uint32_t java_map_index
	}, ; 182
	%struct.TypeMapModuleEntry {
		i32 u0x020001ef, ; uint32_t type_token_id
		i32 877; uint32_t java_map_index
	}, ; 183
	%struct.TypeMapModuleEntry {
		i32 u0x020001f0, ; uint32_t type_token_id
		i32 914; uint32_t java_map_index
	}, ; 184
	%struct.TypeMapModuleEntry {
		i32 u0x020001f3, ; uint32_t type_token_id
		i32 927; uint32_t java_map_index
	}, ; 185
	%struct.TypeMapModuleEntry {
		i32 u0x020001f4, ; uint32_t type_token_id
		i32 443; uint32_t java_map_index
	}, ; 186
	%struct.TypeMapModuleEntry {
		i32 u0x020001f7, ; uint32_t type_token_id
		i32 1079; uint32_t java_map_index
	}, ; 187
	%struct.TypeMapModuleEntry {
		i32 u0x02000209, ; uint32_t type_token_id
		i32 40; uint32_t java_map_index
	}, ; 188
	%struct.TypeMapModuleEntry {
		i32 u0x0200020a, ; uint32_t type_token_id
		i32 963; uint32_t java_map_index
	}, ; 189
	%struct.TypeMapModuleEntry {
		i32 u0x0200020b, ; uint32_t type_token_id
		i32 732; uint32_t java_map_index
	}, ; 190
	%struct.TypeMapModuleEntry {
		i32 u0x0200020c, ; uint32_t type_token_id
		i32 161; uint32_t java_map_index
	}, ; 191
	%struct.TypeMapModuleEntry {
		i32 u0x0200020d, ; uint32_t type_token_id
		i32 1127; uint32_t java_map_index
	}, ; 192
	%struct.TypeMapModuleEntry {
		i32 u0x0200020f, ; uint32_t type_token_id
		i32 992; uint32_t java_map_index
	}, ; 193
	%struct.TypeMapModuleEntry {
		i32 u0x02000210, ; uint32_t type_token_id
		i32 334; uint32_t java_map_index
	}, ; 194
	%struct.TypeMapModuleEntry {
		i32 u0x02000212, ; uint32_t type_token_id
		i32 774; uint32_t java_map_index
	}, ; 195
	%struct.TypeMapModuleEntry {
		i32 u0x02000213, ; uint32_t type_token_id
		i32 852; uint32_t java_map_index
	}, ; 196
	%struct.TypeMapModuleEntry {
		i32 u0x02000217, ; uint32_t type_token_id
		i32 972; uint32_t java_map_index
	}, ; 197
	%struct.TypeMapModuleEntry {
		i32 u0x0200021a, ; uint32_t type_token_id
		i32 987; uint32_t java_map_index
	}, ; 198
	%struct.TypeMapModuleEntry {
		i32 u0x0200021b, ; uint32_t type_token_id
		i32 456; uint32_t java_map_index
	}, ; 199
	%struct.TypeMapModuleEntry {
		i32 u0x0200021c, ; uint32_t type_token_id
		i32 546; uint32_t java_map_index
	}, ; 200
	%struct.TypeMapModuleEntry {
		i32 u0x0200021e, ; uint32_t type_token_id
		i32 426; uint32_t java_map_index
	}, ; 201
	%struct.TypeMapModuleEntry {
		i32 u0x02000220, ; uint32_t type_token_id
		i32 763; uint32_t java_map_index
	}, ; 202
	%struct.TypeMapModuleEntry {
		i32 u0x02000224, ; uint32_t type_token_id
		i32 1071; uint32_t java_map_index
	}, ; 203
	%struct.TypeMapModuleEntry {
		i32 u0x02000225, ; uint32_t type_token_id
		i32 273; uint32_t java_map_index
	}, ; 204
	%struct.TypeMapModuleEntry {
		i32 u0x02000227, ; uint32_t type_token_id
		i32 181; uint32_t java_map_index
	}, ; 205
	%struct.TypeMapModuleEntry {
		i32 u0x0200022a, ; uint32_t type_token_id
		i32 682; uint32_t java_map_index
	}, ; 206
	%struct.TypeMapModuleEntry {
		i32 u0x0200022c, ; uint32_t type_token_id
		i32 1027; uint32_t java_map_index
	}, ; 207
	%struct.TypeMapModuleEntry {
		i32 u0x0200022e, ; uint32_t type_token_id
		i32 1130; uint32_t java_map_index
	}, ; 208
	%struct.TypeMapModuleEntry {
		i32 u0x02000231, ; uint32_t type_token_id
		i32 91; uint32_t java_map_index
	}, ; 209
	%struct.TypeMapModuleEntry {
		i32 u0x02000233, ; uint32_t type_token_id
		i32 1129; uint32_t java_map_index
	}, ; 210
	%struct.TypeMapModuleEntry {
		i32 u0x02000235, ; uint32_t type_token_id
		i32 878; uint32_t java_map_index
	}, ; 211
	%struct.TypeMapModuleEntry {
		i32 u0x02000239, ; uint32_t type_token_id
		i32 783; uint32_t java_map_index
	}, ; 212
	%struct.TypeMapModuleEntry {
		i32 u0x0200023b, ; uint32_t type_token_id
		i32 313; uint32_t java_map_index
	}, ; 213
	%struct.TypeMapModuleEntry {
		i32 u0x0200023d, ; uint32_t type_token_id
		i32 269; uint32_t java_map_index
	}, ; 214
	%struct.TypeMapModuleEntry {
		i32 u0x0200023f, ; uint32_t type_token_id
		i32 380; uint32_t java_map_index
	}, ; 215
	%struct.TypeMapModuleEntry {
		i32 u0x02000241, ; uint32_t type_token_id
		i32 137; uint32_t java_map_index
	}, ; 216
	%struct.TypeMapModuleEntry {
		i32 u0x02000243, ; uint32_t type_token_id
		i32 777; uint32_t java_map_index
	}, ; 217
	%struct.TypeMapModuleEntry {
		i32 u0x02000245, ; uint32_t type_token_id
		i32 664; uint32_t java_map_index
	}, ; 218
	%struct.TypeMapModuleEntry {
		i32 u0x02000247, ; uint32_t type_token_id
		i32 790; uint32_t java_map_index
	}, ; 219
	%struct.TypeMapModuleEntry {
		i32 u0x02000248, ; uint32_t type_token_id
		i32 694; uint32_t java_map_index
	}, ; 220
	%struct.TypeMapModuleEntry {
		i32 u0x0200024b, ; uint32_t type_token_id
		i32 864; uint32_t java_map_index
	}, ; 221
	%struct.TypeMapModuleEntry {
		i32 u0x0200024d, ; uint32_t type_token_id
		i32 861; uint32_t java_map_index
	}, ; 222
	%struct.TypeMapModuleEntry {
		i32 u0x0200024e, ; uint32_t type_token_id
		i32 728; uint32_t java_map_index
	}, ; 223
	%struct.TypeMapModuleEntry {
		i32 u0x02000256, ; uint32_t type_token_id
		i32 463; uint32_t java_map_index
	}, ; 224
	%struct.TypeMapModuleEntry {
		i32 u0x0200025b, ; uint32_t type_token_id
		i32 56; uint32_t java_map_index
	}, ; 225
	%struct.TypeMapModuleEntry {
		i32 u0x0200025e, ; uint32_t type_token_id
		i32 836; uint32_t java_map_index
	}, ; 226
	%struct.TypeMapModuleEntry {
		i32 u0x0200025f, ; uint32_t type_token_id
		i32 1122; uint32_t java_map_index
	}, ; 227
	%struct.TypeMapModuleEntry {
		i32 u0x02000261, ; uint32_t type_token_id
		i32 910; uint32_t java_map_index
	}, ; 228
	%struct.TypeMapModuleEntry {
		i32 u0x02000263, ; uint32_t type_token_id
		i32 505; uint32_t java_map_index
	}, ; 229
	%struct.TypeMapModuleEntry {
		i32 u0x02000266, ; uint32_t type_token_id
		i32 705; uint32_t java_map_index
	}, ; 230
	%struct.TypeMapModuleEntry {
		i32 u0x0200026a, ; uint32_t type_token_id
		i32 504; uint32_t java_map_index
	}, ; 231
	%struct.TypeMapModuleEntry {
		i32 u0x0200026b, ; uint32_t type_token_id
		i32 19; uint32_t java_map_index
	}, ; 232
	%struct.TypeMapModuleEntry {
		i32 u0x0200026c, ; uint32_t type_token_id
		i32 101; uint32_t java_map_index
	}, ; 233
	%struct.TypeMapModuleEntry {
		i32 u0x0200026d, ; uint32_t type_token_id
		i32 134; uint32_t java_map_index
	}, ; 234
	%struct.TypeMapModuleEntry {
		i32 u0x0200026e, ; uint32_t type_token_id
		i32 80; uint32_t java_map_index
	}, ; 235
	%struct.TypeMapModuleEntry {
		i32 u0x02000272, ; uint32_t type_token_id
		i32 729; uint32_t java_map_index
	}, ; 236
	%struct.TypeMapModuleEntry {
		i32 u0x02000277, ; uint32_t type_token_id
		i32 882; uint32_t java_map_index
	}, ; 237
	%struct.TypeMapModuleEntry {
		i32 u0x02000279, ; uint32_t type_token_id
		i32 643; uint32_t java_map_index
	}, ; 238
	%struct.TypeMapModuleEntry {
		i32 u0x0200027c, ; uint32_t type_token_id
		i32 74; uint32_t java_map_index
	}, ; 239
	%struct.TypeMapModuleEntry {
		i32 u0x0200027d, ; uint32_t type_token_id
		i32 1073; uint32_t java_map_index
	}, ; 240
	%struct.TypeMapModuleEntry {
		i32 u0x0200027e, ; uint32_t type_token_id
		i32 770; uint32_t java_map_index
	}, ; 241
	%struct.TypeMapModuleEntry {
		i32 u0x0200027f, ; uint32_t type_token_id
		i32 264; uint32_t java_map_index
	}, ; 242
	%struct.TypeMapModuleEntry {
		i32 u0x02000280, ; uint32_t type_token_id
		i32 635; uint32_t java_map_index
	}, ; 243
	%struct.TypeMapModuleEntry {
		i32 u0x02000282, ; uint32_t type_token_id
		i32 27; uint32_t java_map_index
	}, ; 244
	%struct.TypeMapModuleEntry {
		i32 u0x02000283, ; uint32_t type_token_id
		i32 560; uint32_t java_map_index
	}, ; 245
	%struct.TypeMapModuleEntry {
		i32 u0x02000284, ; uint32_t type_token_id
		i32 461; uint32_t java_map_index
	}, ; 246
	%struct.TypeMapModuleEntry {
		i32 u0x02000289, ; uint32_t type_token_id
		i32 793; uint32_t java_map_index
	}, ; 247
	%struct.TypeMapModuleEntry {
		i32 u0x0200028e, ; uint32_t type_token_id
		i32 588; uint32_t java_map_index
	}, ; 248
	%struct.TypeMapModuleEntry {
		i32 u0x0200028f, ; uint32_t type_token_id
		i32 395; uint32_t java_map_index
	}, ; 249
	%struct.TypeMapModuleEntry {
		i32 u0x02000290, ; uint32_t type_token_id
		i32 1009; uint32_t java_map_index
	}, ; 250
	%struct.TypeMapModuleEntry {
		i32 u0x02000292, ; uint32_t type_token_id
		i32 815; uint32_t java_map_index
	}, ; 251
	%struct.TypeMapModuleEntry {
		i32 u0x02000293, ; uint32_t type_token_id
		i32 1062; uint32_t java_map_index
	}, ; 252
	%struct.TypeMapModuleEntry {
		i32 u0x02000295, ; uint32_t type_token_id
		i32 168; uint32_t java_map_index
	}, ; 253
	%struct.TypeMapModuleEntry {
		i32 u0x02000296, ; uint32_t type_token_id
		i32 849; uint32_t java_map_index
	}, ; 254
	%struct.TypeMapModuleEntry {
		i32 u0x0200029a, ; uint32_t type_token_id
		i32 968; uint32_t java_map_index
	}, ; 255
	%struct.TypeMapModuleEntry {
		i32 u0x0200029b, ; uint32_t type_token_id
		i32 620; uint32_t java_map_index
	}, ; 256
	%struct.TypeMapModuleEntry {
		i32 u0x0200029c, ; uint32_t type_token_id
		i32 312; uint32_t java_map_index
	}, ; 257
	%struct.TypeMapModuleEntry {
		i32 u0x0200029d, ; uint32_t type_token_id
		i32 544; uint32_t java_map_index
	}, ; 258
	%struct.TypeMapModuleEntry {
		i32 u0x0200029e, ; uint32_t type_token_id
		i32 920; uint32_t java_map_index
	}, ; 259
	%struct.TypeMapModuleEntry {
		i32 u0x020002b7, ; uint32_t type_token_id
		i32 1044; uint32_t java_map_index
	}, ; 260
	%struct.TypeMapModuleEntry {
		i32 u0x020002ba, ; uint32_t type_token_id
		i32 795; uint32_t java_map_index
	}, ; 261
	%struct.TypeMapModuleEntry {
		i32 u0x020002bc, ; uint32_t type_token_id
		i32 352; uint32_t java_map_index
	}, ; 262
	%struct.TypeMapModuleEntry {
		i32 u0x020002be, ; uint32_t type_token_id
		i32 397; uint32_t java_map_index
	}, ; 263
	%struct.TypeMapModuleEntry {
		i32 u0x020002c7, ; uint32_t type_token_id
		i32 190; uint32_t java_map_index
	}, ; 264
	%struct.TypeMapModuleEntry {
		i32 u0x020002c9, ; uint32_t type_token_id
		i32 971; uint32_t java_map_index
	}, ; 265
	%struct.TypeMapModuleEntry {
		i32 u0x020002ca, ; uint32_t type_token_id
		i32 947; uint32_t java_map_index
	}, ; 266
	%struct.TypeMapModuleEntry {
		i32 u0x020002cb, ; uint32_t type_token_id
		i32 1126; uint32_t java_map_index
	}, ; 267
	%struct.TypeMapModuleEntry {
		i32 u0x020002d7, ; uint32_t type_token_id
		i32 142; uint32_t java_map_index
	}, ; 268
	%struct.TypeMapModuleEntry {
		i32 u0x020002e0, ; uint32_t type_token_id
		i32 118; uint32_t java_map_index
	}, ; 269
	%struct.TypeMapModuleEntry {
		i32 u0x020002e1, ; uint32_t type_token_id
		i32 999; uint32_t java_map_index
	}, ; 270
	%struct.TypeMapModuleEntry {
		i32 u0x020002e3, ; uint32_t type_token_id
		i32 989; uint32_t java_map_index
	}, ; 271
	%struct.TypeMapModuleEntry {
		i32 u0x020002e4, ; uint32_t type_token_id
		i32 1119; uint32_t java_map_index
	}, ; 272
	%struct.TypeMapModuleEntry {
		i32 u0x020002e5, ; uint32_t type_token_id
		i32 223; uint32_t java_map_index
	}, ; 273
	%struct.TypeMapModuleEntry {
		i32 u0x020002e7, ; uint32_t type_token_id
		i32 1051; uint32_t java_map_index
	}, ; 274
	%struct.TypeMapModuleEntry {
		i32 u0x020002ea, ; uint32_t type_token_id
		i32 237; uint32_t java_map_index
	}, ; 275
	%struct.TypeMapModuleEntry {
		i32 u0x020002eb, ; uint32_t type_token_id
		i32 1046; uint32_t java_map_index
	}, ; 276
	%struct.TypeMapModuleEntry {
		i32 u0x020002ec, ; uint32_t type_token_id
		i32 782; uint32_t java_map_index
	}, ; 277
	%struct.TypeMapModuleEntry {
		i32 u0x020002ed, ; uint32_t type_token_id
		i32 29; uint32_t java_map_index
	}, ; 278
	%struct.TypeMapModuleEntry {
		i32 u0x020002ee, ; uint32_t type_token_id
		i32 876; uint32_t java_map_index
	}, ; 279
	%struct.TypeMapModuleEntry {
		i32 u0x020002ef, ; uint32_t type_token_id
		i32 1011; uint32_t java_map_index
	}, ; 280
	%struct.TypeMapModuleEntry {
		i32 u0x020002f0, ; uint32_t type_token_id
		i32 259; uint32_t java_map_index
	}, ; 281
	%struct.TypeMapModuleEntry {
		i32 u0x020002f1, ; uint32_t type_token_id
		i32 901; uint32_t java_map_index
	}, ; 282
	%struct.TypeMapModuleEntry {
		i32 u0x020002f2, ; uint32_t type_token_id
		i32 900; uint32_t java_map_index
	}, ; 283
	%struct.TypeMapModuleEntry {
		i32 u0x020002f3, ; uint32_t type_token_id
		i32 418; uint32_t java_map_index
	}, ; 284
	%struct.TypeMapModuleEntry {
		i32 u0x020002f4, ; uint32_t type_token_id
		i32 855; uint32_t java_map_index
	}, ; 285
	%struct.TypeMapModuleEntry {
		i32 u0x020002f5, ; uint32_t type_token_id
		i32 438; uint32_t java_map_index
	}, ; 286
	%struct.TypeMapModuleEntry {
		i32 u0x020002f6, ; uint32_t type_token_id
		i32 355; uint32_t java_map_index
	}, ; 287
	%struct.TypeMapModuleEntry {
		i32 u0x020002f7, ; uint32_t type_token_id
		i32 937; uint32_t java_map_index
	}, ; 288
	%struct.TypeMapModuleEntry {
		i32 u0x020002f8, ; uint32_t type_token_id
		i32 596; uint32_t java_map_index
	}, ; 289
	%struct.TypeMapModuleEntry {
		i32 u0x020002f9, ; uint32_t type_token_id
		i32 924; uint32_t java_map_index
	}, ; 290
	%struct.TypeMapModuleEntry {
		i32 u0x020002fa, ; uint32_t type_token_id
		i32 198; uint32_t java_map_index
	}, ; 291
	%struct.TypeMapModuleEntry {
		i32 u0x020002fb, ; uint32_t type_token_id
		i32 976; uint32_t java_map_index
	}, ; 292
	%struct.TypeMapModuleEntry {
		i32 u0x020002fd, ; uint32_t type_token_id
		i32 572; uint32_t java_map_index
	}, ; 293
	%struct.TypeMapModuleEntry {
		i32 u0x020002fe, ; uint32_t type_token_id
		i32 848; uint32_t java_map_index
	}, ; 294
	%struct.TypeMapModuleEntry {
		i32 u0x020002ff, ; uint32_t type_token_id
		i32 1004; uint32_t java_map_index
	}, ; 295
	%struct.TypeMapModuleEntry {
		i32 u0x02000300, ; uint32_t type_token_id
		i32 626; uint32_t java_map_index
	}, ; 296
	%struct.TypeMapModuleEntry {
		i32 u0x02000301, ; uint32_t type_token_id
		i32 659; uint32_t java_map_index
	}, ; 297
	%struct.TypeMapModuleEntry {
		i32 u0x02000302, ; uint32_t type_token_id
		i32 480; uint32_t java_map_index
	}, ; 298
	%struct.TypeMapModuleEntry {
		i32 u0x02000303, ; uint32_t type_token_id
		i32 252; uint32_t java_map_index
	}, ; 299
	%struct.TypeMapModuleEntry {
		i32 u0x02000304, ; uint32_t type_token_id
		i32 1137; uint32_t java_map_index
	}, ; 300
	%struct.TypeMapModuleEntry {
		i32 u0x02000305, ; uint32_t type_token_id
		i32 364; uint32_t java_map_index
	}, ; 301
	%struct.TypeMapModuleEntry {
		i32 u0x02000306, ; uint32_t type_token_id
		i32 33; uint32_t java_map_index
	}, ; 302
	%struct.TypeMapModuleEntry {
		i32 u0x02000307, ; uint32_t type_token_id
		i32 70; uint32_t java_map_index
	}, ; 303
	%struct.TypeMapModuleEntry {
		i32 u0x02000308, ; uint32_t type_token_id
		i32 1036; uint32_t java_map_index
	}, ; 304
	%struct.TypeMapModuleEntry {
		i32 u0x02000309, ; uint32_t type_token_id
		i32 379; uint32_t java_map_index
	}, ; 305
	%struct.TypeMapModuleEntry {
		i32 u0x0200030a, ; uint32_t type_token_id
		i32 1038; uint32_t java_map_index
	}, ; 306
	%struct.TypeMapModuleEntry {
		i32 u0x0200030b, ; uint32_t type_token_id
		i32 1117; uint32_t java_map_index
	}, ; 307
	%struct.TypeMapModuleEntry {
		i32 u0x0200030c, ; uint32_t type_token_id
		i32 648; uint32_t java_map_index
	}, ; 308
	%struct.TypeMapModuleEntry {
		i32 u0x0200030d, ; uint32_t type_token_id
		i32 883; uint32_t java_map_index
	}, ; 309
	%struct.TypeMapModuleEntry {
		i32 u0x0200030e, ; uint32_t type_token_id
		i32 1020; uint32_t java_map_index
	}, ; 310
	%struct.TypeMapModuleEntry {
		i32 u0x02000310, ; uint32_t type_token_id
		i32 322; uint32_t java_map_index
	}, ; 311
	%struct.TypeMapModuleEntry {
		i32 u0x02000311, ; uint32_t type_token_id
		i32 744; uint32_t java_map_index
	}, ; 312
	%struct.TypeMapModuleEntry {
		i32 u0x02000312, ; uint32_t type_token_id
		i32 507; uint32_t java_map_index
	}, ; 313
	%struct.TypeMapModuleEntry {
		i32 u0x02000314, ; uint32_t type_token_id
		i32 1057; uint32_t java_map_index
	}, ; 314
	%struct.TypeMapModuleEntry {
		i32 u0x02000315, ; uint32_t type_token_id
		i32 513; uint32_t java_map_index
	}, ; 315
	%struct.TypeMapModuleEntry {
		i32 u0x02000316, ; uint32_t type_token_id
		i32 752; uint32_t java_map_index
	}, ; 316
	%struct.TypeMapModuleEntry {
		i32 u0x02000317, ; uint32_t type_token_id
		i32 959; uint32_t java_map_index
	}, ; 317
	%struct.TypeMapModuleEntry {
		i32 u0x02000318, ; uint32_t type_token_id
		i32 145; uint32_t java_map_index
	}, ; 318
	%struct.TypeMapModuleEntry {
		i32 u0x0200031a, ; uint32_t type_token_id
		i32 1000; uint32_t java_map_index
	}, ; 319
	%struct.TypeMapModuleEntry {
		i32 u0x0200031c, ; uint32_t type_token_id
		i32 539; uint32_t java_map_index
	}, ; 320
	%struct.TypeMapModuleEntry {
		i32 u0x0200031d, ; uint32_t type_token_id
		i32 193; uint32_t java_map_index
	}, ; 321
	%struct.TypeMapModuleEntry {
		i32 u0x0200031f, ; uint32_t type_token_id
		i32 399; uint32_t java_map_index
	}, ; 322
	%struct.TypeMapModuleEntry {
		i32 u0x02000321, ; uint32_t type_token_id
		i32 691; uint32_t java_map_index
	}, ; 323
	%struct.TypeMapModuleEntry {
		i32 u0x02000322, ; uint32_t type_token_id
		i32 205; uint32_t java_map_index
	}, ; 324
	%struct.TypeMapModuleEntry {
		i32 u0x02000323, ; uint32_t type_token_id
		i32 1066; uint32_t java_map_index
	}, ; 325
	%struct.TypeMapModuleEntry {
		i32 u0x02000324, ; uint32_t type_token_id
		i32 493; uint32_t java_map_index
	}, ; 326
	%struct.TypeMapModuleEntry {
		i32 u0x02000325, ; uint32_t type_token_id
		i32 742; uint32_t java_map_index
	}, ; 327
	%struct.TypeMapModuleEntry {
		i32 u0x02000328, ; uint32_t type_token_id
		i32 1058; uint32_t java_map_index
	}, ; 328
	%struct.TypeMapModuleEntry {
		i32 u0x02000329, ; uint32_t type_token_id
		i32 274; uint32_t java_map_index
	}, ; 329
	%struct.TypeMapModuleEntry {
		i32 u0x0200032a, ; uint32_t type_token_id
		i32 474; uint32_t java_map_index
	}, ; 330
	%struct.TypeMapModuleEntry {
		i32 u0x0200032b, ; uint32_t type_token_id
		i32 903; uint32_t java_map_index
	}, ; 331
	%struct.TypeMapModuleEntry {
		i32 u0x0200032f, ; uint32_t type_token_id
		i32 416; uint32_t java_map_index
	}, ; 332
	%struct.TypeMapModuleEntry {
		i32 u0x02000330, ; uint32_t type_token_id
		i32 578; uint32_t java_map_index
	}, ; 333
	%struct.TypeMapModuleEntry {
		i32 u0x02000331, ; uint32_t type_token_id
		i32 1069; uint32_t java_map_index
	}, ; 334
	%struct.TypeMapModuleEntry {
		i32 u0x02000332, ; uint32_t type_token_id
		i32 540; uint32_t java_map_index
	}, ; 335
	%struct.TypeMapModuleEntry {
		i32 u0x02000334, ; uint32_t type_token_id
		i32 524; uint32_t java_map_index
	}, ; 336
	%struct.TypeMapModuleEntry {
		i32 u0x02000336, ; uint32_t type_token_id
		i32 477; uint32_t java_map_index
	}, ; 337
	%struct.TypeMapModuleEntry {
		i32 u0x02000337, ; uint32_t type_token_id
		i32 464; uint32_t java_map_index
	}, ; 338
	%struct.TypeMapModuleEntry {
		i32 u0x02000338, ; uint32_t type_token_id
		i32 859; uint32_t java_map_index
	}, ; 339
	%struct.TypeMapModuleEntry {
		i32 u0x02000339, ; uint32_t type_token_id
		i32 370; uint32_t java_map_index
	}, ; 340
	%struct.TypeMapModuleEntry {
		i32 u0x0200033b, ; uint32_t type_token_id
		i32 226; uint32_t java_map_index
	}, ; 341
	%struct.TypeMapModuleEntry {
		i32 u0x0200033e, ; uint32_t type_token_id
		i32 1050; uint32_t java_map_index
	}, ; 342
	%struct.TypeMapModuleEntry {
		i32 u0x02000340, ; uint32_t type_token_id
		i32 709; uint32_t java_map_index
	}, ; 343
	%struct.TypeMapModuleEntry {
		i32 u0x02000342, ; uint32_t type_token_id
		i32 389; uint32_t java_map_index
	}, ; 344
	%struct.TypeMapModuleEntry {
		i32 u0x02000343, ; uint32_t type_token_id
		i32 780; uint32_t java_map_index
	}, ; 345
	%struct.TypeMapModuleEntry {
		i32 u0x02000346, ; uint32_t type_token_id
		i32 1035; uint32_t java_map_index
	}, ; 346
	%struct.TypeMapModuleEntry {
		i32 u0x02000347, ; uint32_t type_token_id
		i32 149; uint32_t java_map_index
	}, ; 347
	%struct.TypeMapModuleEntry {
		i32 u0x02000349, ; uint32_t type_token_id
		i32 523; uint32_t java_map_index
	}, ; 348
	%struct.TypeMapModuleEntry {
		i32 u0x0200034a, ; uint32_t type_token_id
		i32 701; uint32_t java_map_index
	}, ; 349
	%struct.TypeMapModuleEntry {
		i32 u0x0200034c, ; uint32_t type_token_id
		i32 510; uint32_t java_map_index
	}, ; 350
	%struct.TypeMapModuleEntry {
		i32 u0x0200034f, ; uint32_t type_token_id
		i32 119; uint32_t java_map_index
	}, ; 351
	%struct.TypeMapModuleEntry {
		i32 u0x02000351, ; uint32_t type_token_id
		i32 601; uint32_t java_map_index
	}, ; 352
	%struct.TypeMapModuleEntry {
		i32 u0x02000352, ; uint32_t type_token_id
		i32 548; uint32_t java_map_index
	}, ; 353
	%struct.TypeMapModuleEntry {
		i32 u0x02000354, ; uint32_t type_token_id
		i32 622; uint32_t java_map_index
	}, ; 354
	%struct.TypeMapModuleEntry {
		i32 u0x02000355, ; uint32_t type_token_id
		i32 566; uint32_t java_map_index
	}, ; 355
	%struct.TypeMapModuleEntry {
		i32 u0x02000356, ; uint32_t type_token_id
		i32 82; uint32_t java_map_index
	}, ; 356
	%struct.TypeMapModuleEntry {
		i32 u0x02000358, ; uint32_t type_token_id
		i32 681; uint32_t java_map_index
	}, ; 357
	%struct.TypeMapModuleEntry {
		i32 u0x0200035a, ; uint32_t type_token_id
		i32 918; uint32_t java_map_index
	}, ; 358
	%struct.TypeMapModuleEntry {
		i32 u0x0200035e, ; uint32_t type_token_id
		i32 221; uint32_t java_map_index
	}, ; 359
	%struct.TypeMapModuleEntry {
		i32 u0x0200035f, ; uint32_t type_token_id
		i32 482; uint32_t java_map_index
	}, ; 360
	%struct.TypeMapModuleEntry {
		i32 u0x02000360, ; uint32_t type_token_id
		i32 575; uint32_t java_map_index
	}, ; 361
	%struct.TypeMapModuleEntry {
		i32 u0x02000362, ; uint32_t type_token_id
		i32 268; uint32_t java_map_index
	}, ; 362
	%struct.TypeMapModuleEntry {
		i32 u0x02000363, ; uint32_t type_token_id
		i32 651; uint32_t java_map_index
	}, ; 363
	%struct.TypeMapModuleEntry {
		i32 u0x02000364, ; uint32_t type_token_id
		i32 998; uint32_t java_map_index
	}, ; 364
	%struct.TypeMapModuleEntry {
		i32 u0x02000366, ; uint32_t type_token_id
		i32 710; uint32_t java_map_index
	}, ; 365
	%struct.TypeMapModuleEntry {
		i32 u0x02000367, ; uint32_t type_token_id
		i32 375; uint32_t java_map_index
	}, ; 366
	%struct.TypeMapModuleEntry {
		i32 u0x0200036b, ; uint32_t type_token_id
		i32 775; uint32_t java_map_index
	}, ; 367
	%struct.TypeMapModuleEntry {
		i32 u0x0200036d, ; uint32_t type_token_id
		i32 11; uint32_t java_map_index
	}, ; 368
	%struct.TypeMapModuleEntry {
		i32 u0x02000371, ; uint32_t type_token_id
		i32 846; uint32_t java_map_index
	}, ; 369
	%struct.TypeMapModuleEntry {
		i32 u0x02000372, ; uint32_t type_token_id
		i32 1102; uint32_t java_map_index
	}, ; 370
	%struct.TypeMapModuleEntry {
		i32 u0x02000373, ; uint32_t type_token_id
		i32 1039; uint32_t java_map_index
	}, ; 371
	%struct.TypeMapModuleEntry {
		i32 u0x02000374, ; uint32_t type_token_id
		i32 714; uint32_t java_map_index
	}, ; 372
	%struct.TypeMapModuleEntry {
		i32 u0x02000378, ; uint32_t type_token_id
		i32 535; uint32_t java_map_index
	}, ; 373
	%struct.TypeMapModuleEntry {
		i32 u0x02000379, ; uint32_t type_token_id
		i32 423; uint32_t java_map_index
	}, ; 374
	%struct.TypeMapModuleEntry {
		i32 u0x0200037a, ; uint32_t type_token_id
		i32 564; uint32_t java_map_index
	}, ; 375
	%struct.TypeMapModuleEntry {
		i32 u0x0200037b, ; uint32_t type_token_id
		i32 617; uint32_t java_map_index
	}, ; 376
	%struct.TypeMapModuleEntry {
		i32 u0x0200037c, ; uint32_t type_token_id
		i32 469; uint32_t java_map_index
	}, ; 377
	%struct.TypeMapModuleEntry {
		i32 u0x0200037e, ; uint32_t type_token_id
		i32 321; uint32_t java_map_index
	}, ; 378
	%struct.TypeMapModuleEntry {
		i32 u0x02000380, ; uint32_t type_token_id
		i32 692; uint32_t java_map_index
	}, ; 379
	%struct.TypeMapModuleEntry {
		i32 u0x02000382, ; uint32_t type_token_id
		i32 24; uint32_t java_map_index
	}, ; 380
	%struct.TypeMapModuleEntry {
		i32 u0x02000383, ; uint32_t type_token_id
		i32 1061; uint32_t java_map_index
	}, ; 381
	%struct.TypeMapModuleEntry {
		i32 u0x0200038e, ; uint32_t type_token_id
		i32 178; uint32_t java_map_index
	}, ; 382
	%struct.TypeMapModuleEntry {
		i32 u0x0200038f, ; uint32_t type_token_id
		i32 1034; uint32_t java_map_index
	}, ; 383
	%struct.TypeMapModuleEntry {
		i32 u0x02000392, ; uint32_t type_token_id
		i32 224; uint32_t java_map_index
	}, ; 384
	%struct.TypeMapModuleEntry {
		i32 u0x02000393, ; uint32_t type_token_id
		i32 120; uint32_t java_map_index
	}, ; 385
	%struct.TypeMapModuleEntry {
		i32 u0x02000394, ; uint32_t type_token_id
		i32 647; uint32_t java_map_index
	}, ; 386
	%struct.TypeMapModuleEntry {
		i32 u0x02000396, ; uint32_t type_token_id
		i32 141; uint32_t java_map_index
	}, ; 387
	%struct.TypeMapModuleEntry {
		i32 u0x02000397, ; uint32_t type_token_id
		i32 51; uint32_t java_map_index
	}, ; 388
	%struct.TypeMapModuleEntry {
		i32 u0x02000398, ; uint32_t type_token_id
		i32 212; uint32_t java_map_index
	}, ; 389
	%struct.TypeMapModuleEntry {
		i32 u0x02000399, ; uint32_t type_token_id
		i32 700; uint32_t java_map_index
	}, ; 390
	%struct.TypeMapModuleEntry {
		i32 u0x0200039b, ; uint32_t type_token_id
		i32 794; uint32_t java_map_index
	}, ; 391
	%struct.TypeMapModuleEntry {
		i32 u0x0200039d, ; uint32_t type_token_id
		i32 113; uint32_t java_map_index
	}, ; 392
	%struct.TypeMapModuleEntry {
		i32 u0x0200039f, ; uint32_t type_token_id
		i32 378; uint32_t java_map_index
	}, ; 393
	%struct.TypeMapModuleEntry {
		i32 u0x020003a1, ; uint32_t type_token_id
		i32 967; uint32_t java_map_index
	}, ; 394
	%struct.TypeMapModuleEntry {
		i32 u0x020003a2, ; uint32_t type_token_id
		i32 985; uint32_t java_map_index
	}, ; 395
	%struct.TypeMapModuleEntry {
		i32 u0x020003a3, ; uint32_t type_token_id
		i32 892; uint32_t java_map_index
	}, ; 396
	%struct.TypeMapModuleEntry {
		i32 u0x020003a4, ; uint32_t type_token_id
		i32 614; uint32_t java_map_index
	}, ; 397
	%struct.TypeMapModuleEntry {
		i32 u0x020003a5, ; uint32_t type_token_id
		i32 265; uint32_t java_map_index
	}, ; 398
	%struct.TypeMapModuleEntry {
		i32 u0x020003a7, ; uint32_t type_token_id
		i32 658; uint32_t java_map_index
	}, ; 399
	%struct.TypeMapModuleEntry {
		i32 u0x020003a8, ; uint32_t type_token_id
		i32 335; uint32_t java_map_index
	}, ; 400
	%struct.TypeMapModuleEntry {
		i32 u0x020003a9, ; uint32_t type_token_id
		i32 613; uint32_t java_map_index
	}, ; 401
	%struct.TypeMapModuleEntry {
		i32 u0x020003aa, ; uint32_t type_token_id
		i32 172; uint32_t java_map_index
	}, ; 402
	%struct.TypeMapModuleEntry {
		i32 u0x020003ab, ; uint32_t type_token_id
		i32 932; uint32_t java_map_index
	}, ; 403
	%struct.TypeMapModuleEntry {
		i32 u0x020003ad, ; uint32_t type_token_id
		i32 712; uint32_t java_map_index
	}, ; 404
	%struct.TypeMapModuleEntry {
		i32 u0x020003ae, ; uint32_t type_token_id
		i32 597; uint32_t java_map_index
	}, ; 405
	%struct.TypeMapModuleEntry {
		i32 u0x020003b0, ; uint32_t type_token_id
		i32 437; uint32_t java_map_index
	}, ; 406
	%struct.TypeMapModuleEntry {
		i32 u0x020003b2, ; uint32_t type_token_id
		i32 412; uint32_t java_map_index
	}, ; 407
	%struct.TypeMapModuleEntry {
		i32 u0x020003b4, ; uint32_t type_token_id
		i32 1100; uint32_t java_map_index
	}, ; 408
	%struct.TypeMapModuleEntry {
		i32 u0x020003b5, ; uint32_t type_token_id
		i32 1025; uint32_t java_map_index
	}, ; 409
	%struct.TypeMapModuleEntry {
		i32 u0x020003b6, ; uint32_t type_token_id
		i32 953; uint32_t java_map_index
	}, ; 410
	%struct.TypeMapModuleEntry {
		i32 u0x020003b7, ; uint32_t type_token_id
		i32 567; uint32_t java_map_index
	}, ; 411
	%struct.TypeMapModuleEntry {
		i32 u0x020003b8, ; uint32_t type_token_id
		i32 79; uint32_t java_map_index
	}, ; 412
	%struct.TypeMapModuleEntry {
		i32 u0x020003ba, ; uint32_t type_token_id
		i32 996; uint32_t java_map_index
	}, ; 413
	%struct.TypeMapModuleEntry {
		i32 u0x020003bc, ; uint32_t type_token_id
		i32 166; uint32_t java_map_index
	}, ; 414
	%struct.TypeMapModuleEntry {
		i32 u0x020003bd, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	}, ; 415
	%struct.TypeMapModuleEntry {
		i32 u0x020003bf, ; uint32_t type_token_id
		i32 1081; uint32_t java_map_index
	}, ; 416
	%struct.TypeMapModuleEntry {
		i32 u0x020003c1, ; uint32_t type_token_id
		i32 236; uint32_t java_map_index
	}, ; 417
	%struct.TypeMapModuleEntry {
		i32 u0x020003c3, ; uint32_t type_token_id
		i32 1136; uint32_t java_map_index
	}, ; 418
	%struct.TypeMapModuleEntry {
		i32 u0x020003c5, ; uint32_t type_token_id
		i32 153; uint32_t java_map_index
	}, ; 419
	%struct.TypeMapModuleEntry {
		i32 u0x020003c7, ; uint32_t type_token_id
		i32 401; uint32_t java_map_index
	}, ; 420
	%struct.TypeMapModuleEntry {
		i32 u0x020003c9, ; uint32_t type_token_id
		i32 413; uint32_t java_map_index
	}, ; 421
	%struct.TypeMapModuleEntry {
		i32 u0x020003ca, ; uint32_t type_token_id
		i32 256; uint32_t java_map_index
	}, ; 422
	%struct.TypeMapModuleEntry {
		i32 u0x020003cb, ; uint32_t type_token_id
		i32 689; uint32_t java_map_index
	}, ; 423
	%struct.TypeMapModuleEntry {
		i32 u0x020003cc, ; uint32_t type_token_id
		i32 23; uint32_t java_map_index
	}, ; 424
	%struct.TypeMapModuleEntry {
		i32 u0x020003cd, ; uint32_t type_token_id
		i32 1142; uint32_t java_map_index
	}, ; 425
	%struct.TypeMapModuleEntry {
		i32 u0x020003cf, ; uint32_t type_token_id
		i32 1021; uint32_t java_map_index
	}, ; 426
	%struct.TypeMapModuleEntry {
		i32 u0x020003d1, ; uint32_t type_token_id
		i32 720; uint32_t java_map_index
	}, ; 427
	%struct.TypeMapModuleEntry {
		i32 u0x020003d2, ; uint32_t type_token_id
		i32 1108; uint32_t java_map_index
	}, ; 428
	%struct.TypeMapModuleEntry {
		i32 u0x020003d3, ; uint32_t type_token_id
		i32 167; uint32_t java_map_index
	}, ; 429
	%struct.TypeMapModuleEntry {
		i32 u0x020003d5, ; uint32_t type_token_id
		i32 522; uint32_t java_map_index
	}, ; 430
	%struct.TypeMapModuleEntry {
		i32 u0x020003d7, ; uint32_t type_token_id
		i32 204; uint32_t java_map_index
	}, ; 431
	%struct.TypeMapModuleEntry {
		i32 u0x020003d8, ; uint32_t type_token_id
		i32 663; uint32_t java_map_index
	}, ; 432
	%struct.TypeMapModuleEntry {
		i32 u0x020003d9, ; uint32_t type_token_id
		i32 1080; uint32_t java_map_index
	}, ; 433
	%struct.TypeMapModuleEntry {
		i32 u0x020003db, ; uint32_t type_token_id
		i32 1086; uint32_t java_map_index
	}, ; 434
	%struct.TypeMapModuleEntry {
		i32 u0x020003dd, ; uint32_t type_token_id
		i32 42; uint32_t java_map_index
	}, ; 435
	%struct.TypeMapModuleEntry {
		i32 u0x020003e0, ; uint32_t type_token_id
		i32 420; uint32_t java_map_index
	}, ; 436
	%struct.TypeMapModuleEntry {
		i32 u0x020003e2, ; uint32_t type_token_id
		i32 302; uint32_t java_map_index
	}, ; 437
	%struct.TypeMapModuleEntry {
		i32 u0x020003e4, ; uint32_t type_token_id
		i32 112; uint32_t java_map_index
	}, ; 438
	%struct.TypeMapModuleEntry {
		i32 u0x020003e7, ; uint32_t type_token_id
		i32 465; uint32_t java_map_index
	}, ; 439
	%struct.TypeMapModuleEntry {
		i32 u0x020003e9, ; uint32_t type_token_id
		i32 879; uint32_t java_map_index
	}, ; 440
	%struct.TypeMapModuleEntry {
		i32 u0x020003eb, ; uint32_t type_token_id
		i32 483; uint32_t java_map_index
	}, ; 441
	%struct.TypeMapModuleEntry {
		i32 u0x020003ed, ; uint32_t type_token_id
		i32 769; uint32_t java_map_index
	}, ; 442
	%struct.TypeMapModuleEntry {
		i32 u0x020003ef, ; uint32_t type_token_id
		i32 554; uint32_t java_map_index
	}, ; 443
	%struct.TypeMapModuleEntry {
		i32 u0x020003f0, ; uint32_t type_token_id
		i32 471; uint32_t java_map_index
	}, ; 444
	%struct.TypeMapModuleEntry {
		i32 u0x020003f2, ; uint32_t type_token_id
		i32 283; uint32_t java_map_index
	}, ; 445
	%struct.TypeMapModuleEntry {
		i32 u0x020003f4, ; uint32_t type_token_id
		i32 83; uint32_t java_map_index
	}, ; 446
	%struct.TypeMapModuleEntry {
		i32 u0x020003f6, ; uint32_t type_token_id
		i32 931; uint32_t java_map_index
	}, ; 447
	%struct.TypeMapModuleEntry {
		i32 u0x020003f8, ; uint32_t type_token_id
		i32 765; uint32_t java_map_index
	}, ; 448
	%struct.TypeMapModuleEntry {
		i32 u0x020003fa, ; uint32_t type_token_id
		i32 384; uint32_t java_map_index
	}, ; 449
	%struct.TypeMapModuleEntry {
		i32 u0x020003fc, ; uint32_t type_token_id
		i32 1133; uint32_t java_map_index
	}, ; 450
	%struct.TypeMapModuleEntry {
		i32 u0x020003fe, ; uint32_t type_token_id
		i32 957; uint32_t java_map_index
	}, ; 451
	%struct.TypeMapModuleEntry {
		i32 u0x02000400, ; uint32_t type_token_id
		i32 556; uint32_t java_map_index
	}, ; 452
	%struct.TypeMapModuleEntry {
		i32 u0x02000402, ; uint32_t type_token_id
		i32 146; uint32_t java_map_index
	}, ; 453
	%struct.TypeMapModuleEntry {
		i32 u0x02000404, ; uint32_t type_token_id
		i32 402; uint32_t java_map_index
	}, ; 454
	%struct.TypeMapModuleEntry {
		i32 u0x02000406, ; uint32_t type_token_id
		i32 818; uint32_t java_map_index
	}, ; 455
	%struct.TypeMapModuleEntry {
		i32 u0x02000407, ; uint32_t type_token_id
		i32 941; uint32_t java_map_index
	}, ; 456
	%struct.TypeMapModuleEntry {
		i32 u0x02000409, ; uint32_t type_token_id
		i32 131; uint32_t java_map_index
	}, ; 457
	%struct.TypeMapModuleEntry {
		i32 u0x0200040a, ; uint32_t type_token_id
		i32 536; uint32_t java_map_index
	}, ; 458
	%struct.TypeMapModuleEntry {
		i32 u0x0200040b, ; uint32_t type_token_id
		i32 447; uint32_t java_map_index
	}, ; 459
	%struct.TypeMapModuleEntry {
		i32 u0x0200040c, ; uint32_t type_token_id
		i32 459; uint32_t java_map_index
	}, ; 460
	%struct.TypeMapModuleEntry {
		i32 u0x0200040d, ; uint32_t type_token_id
		i32 1014; uint32_t java_map_index
	}, ; 461
	%struct.TypeMapModuleEntry {
		i32 u0x0200040e, ; uint32_t type_token_id
		i32 307; uint32_t java_map_index
	}, ; 462
	%struct.TypeMapModuleEntry {
		i32 u0x0200040f, ; uint32_t type_token_id
		i32 977; uint32_t java_map_index
	}, ; 463
	%struct.TypeMapModuleEntry {
		i32 u0x02000410, ; uint32_t type_token_id
		i32 787; uint32_t java_map_index
	}, ; 464
	%struct.TypeMapModuleEntry {
		i32 u0x02000411, ; uint32_t type_token_id
		i32 751; uint32_t java_map_index
	}, ; 465
	%struct.TypeMapModuleEntry {
		i32 u0x02000412, ; uint32_t type_token_id
		i32 203; uint32_t java_map_index
	}, ; 466
	%struct.TypeMapModuleEntry {
		i32 u0x02000413, ; uint32_t type_token_id
		i32 208; uint32_t java_map_index
	}, ; 467
	%struct.TypeMapModuleEntry {
		i32 u0x02000414, ; uint32_t type_token_id
		i32 109; uint32_t java_map_index
	}, ; 468
	%struct.TypeMapModuleEntry {
		i32 u0x02000415, ; uint32_t type_token_id
		i32 2; uint32_t java_map_index
	}, ; 469
	%struct.TypeMapModuleEntry {
		i32 u0x02000416, ; uint32_t type_token_id
		i32 722; uint32_t java_map_index
	}, ; 470
	%struct.TypeMapModuleEntry {
		i32 u0x02000417, ; uint32_t type_token_id
		i32 441; uint32_t java_map_index
	}, ; 471
	%struct.TypeMapModuleEntry {
		i32 u0x02000418, ; uint32_t type_token_id
		i32 227; uint32_t java_map_index
	}, ; 472
	%struct.TypeMapModuleEntry {
		i32 u0x02000419, ; uint32_t type_token_id
		i32 964; uint32_t java_map_index
	}, ; 473
	%struct.TypeMapModuleEntry {
		i32 u0x0200041b, ; uint32_t type_token_id
		i32 211; uint32_t java_map_index
	}, ; 474
	%struct.TypeMapModuleEntry {
		i32 u0x0200041c, ; uint32_t type_token_id
		i32 105; uint32_t java_map_index
	}, ; 475
	%struct.TypeMapModuleEntry {
		i32 u0x0200041d, ; uint32_t type_token_id
		i32 342; uint32_t java_map_index
	}, ; 476
	%struct.TypeMapModuleEntry {
		i32 u0x0200041e, ; uint32_t type_token_id
		i32 363; uint32_t java_map_index
	}, ; 477
	%struct.TypeMapModuleEntry {
		i32 u0x0200041f, ; uint32_t type_token_id
		i32 115; uint32_t java_map_index
	}, ; 478
	%struct.TypeMapModuleEntry {
		i32 u0x02000421, ; uint32_t type_token_id
		i32 639; uint32_t java_map_index
	}, ; 479
	%struct.TypeMapModuleEntry {
		i32 u0x02000423, ; uint32_t type_token_id
		i32 1056; uint32_t java_map_index
	}, ; 480
	%struct.TypeMapModuleEntry {
		i32 u0x02000424, ; uint32_t type_token_id
		i32 316; uint32_t java_map_index
	}, ; 481
	%struct.TypeMapModuleEntry {
		i32 u0x02000426, ; uint32_t type_token_id
		i32 3; uint32_t java_map_index
	}, ; 482
	%struct.TypeMapModuleEntry {
		i32 u0x0200042a, ; uint32_t type_token_id
		i32 306; uint32_t java_map_index
	}, ; 483
	%struct.TypeMapModuleEntry {
		i32 u0x0200042c, ; uint32_t type_token_id
		i32 632; uint32_t java_map_index
	}, ; 484
	%struct.TypeMapModuleEntry {
		i32 u0x0200042e, ; uint32_t type_token_id
		i32 54; uint32_t java_map_index
	}, ; 485
	%struct.TypeMapModuleEntry {
		i32 u0x0200042f, ; uint32_t type_token_id
		i32 156; uint32_t java_map_index
	}, ; 486
	%struct.TypeMapModuleEntry {
		i32 u0x02000430, ; uint32_t type_token_id
		i32 442; uint32_t java_map_index
	}, ; 487
	%struct.TypeMapModuleEntry {
		i32 u0x02000431, ; uint32_t type_token_id
		i32 498; uint32_t java_map_index
	}, ; 488
	%struct.TypeMapModuleEntry {
		i32 u0x02000433, ; uint32_t type_token_id
		i32 123; uint32_t java_map_index
	}, ; 489
	%struct.TypeMapModuleEntry {
		i32 u0x02000434, ; uint32_t type_token_id
		i32 1070; uint32_t java_map_index
	}, ; 490
	%struct.TypeMapModuleEntry {
		i32 u0x02000435, ; uint32_t type_token_id
		i32 219; uint32_t java_map_index
	}, ; 491
	%struct.TypeMapModuleEntry {
		i32 u0x02000436, ; uint32_t type_token_id
		i32 917; uint32_t java_map_index
	}, ; 492
	%struct.TypeMapModuleEntry {
		i32 u0x02000438, ; uint32_t type_token_id
		i32 71; uint32_t java_map_index
	}, ; 493
	%struct.TypeMapModuleEntry {
		i32 u0x02000439, ; uint32_t type_token_id
		i32 377; uint32_t java_map_index
	}, ; 494
	%struct.TypeMapModuleEntry {
		i32 u0x0200043a, ; uint32_t type_token_id
		i32 776; uint32_t java_map_index
	}, ; 495
	%struct.TypeMapModuleEntry {
		i32 u0x0200043b, ; uint32_t type_token_id
		i32 650; uint32_t java_map_index
	}, ; 496
	%struct.TypeMapModuleEntry {
		i32 u0x0200043c, ; uint32_t type_token_id
		i32 1109; uint32_t java_map_index
	}, ; 497
	%struct.TypeMapModuleEntry {
		i32 u0x0200043d, ; uint32_t type_token_id
		i32 280; uint32_t java_map_index
	}, ; 498
	%struct.TypeMapModuleEntry {
		i32 u0x0200044e, ; uint32_t type_token_id
		i32 796; uint32_t java_map_index
	} ; 499
], align 4

@module31_managed_to_java_duplicates = internal dso_local constant [205 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x020000b4, ; uint32_t type_token_id
		i32 600; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x020000b9, ; uint32_t type_token_id
		i32 327; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x020000bb, ; uint32_t type_token_id
		i32 75; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x020000be, ; uint32_t type_token_id
		i32 982; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x020000c0, ; uint32_t type_token_id
		i32 912; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x020000c2, ; uint32_t type_token_id
		i32 723; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x020000c4, ; uint32_t type_token_id
		i32 366; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x020000c6, ; uint32_t type_token_id
		i32 886; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x020000c8, ; uint32_t type_token_id
		i32 39; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x020000ca, ; uint32_t type_token_id
		i32 225; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x020000ce, ; uint32_t type_token_id
		i32 1047; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x020000d4, ; uint32_t type_token_id
		i32 55; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x020000d6, ; uint32_t type_token_id
		i32 670; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x020000da, ; uint32_t type_token_id
		i32 434; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x020000dc, ; uint32_t type_token_id
		i32 1023; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x020000de, ; uint32_t type_token_id
		i32 739; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x020000e2, ; uint32_t type_token_id
		i32 34; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x020000e5, ; uint32_t type_token_id
		i32 73; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x020000e7, ; uint32_t type_token_id
		i32 555; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x020000ea, ; uint32_t type_token_id
		i32 827; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x020000ed, ; uint32_t type_token_id
		i32 677; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x020000f2, ; uint32_t type_token_id
		i32 278; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x020000f4, ; uint32_t type_token_id
		i32 267; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x020000f7, ; uint32_t type_token_id
		i32 231; uint32_t java_map_index
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 u0x020000fa, ; uint32_t type_token_id
		i32 97; uint32_t java_map_index
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 u0x020000fb, ; uint32_t type_token_id
		i32 949; uint32_t java_map_index
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 u0x020000fe, ; uint32_t type_token_id
		i32 538; uint32_t java_map_index
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 u0x02000102, ; uint32_t type_token_id
		i32 295; uint32_t java_map_index
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 u0x02000104, ; uint32_t type_token_id
		i32 521; uint32_t java_map_index
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 u0x02000105, ; uint32_t type_token_id
		i32 547; uint32_t java_map_index
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 u0x0200010f, ; uint32_t type_token_id
		i32 289; uint32_t java_map_index
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 u0x02000117, ; uint32_t type_token_id
		i32 571; uint32_t java_map_index
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 u0x02000118, ; uint32_t type_token_id
		i32 547; uint32_t java_map_index
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 u0x02000119, ; uint32_t type_token_id
		i32 703; uint32_t java_map_index
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 u0x0200011a, ; uint32_t type_token_id
		i32 703; uint32_t java_map_index
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 u0x02000120, ; uint32_t type_token_id
		i32 1143; uint32_t java_map_index
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 u0x02000126, ; uint32_t type_token_id
		i32 454; uint32_t java_map_index
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 u0x0200012b, ; uint32_t type_token_id
		i32 155; uint32_t java_map_index
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 u0x02000130, ; uint32_t type_token_id
		i32 730; uint32_t java_map_index
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 u0x02000132, ; uint32_t type_token_id
		i32 348; uint32_t java_map_index
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 u0x02000134, ; uint32_t type_token_id
		i32 1060; uint32_t java_map_index
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 u0x02000136, ; uint32_t type_token_id
		i32 8; uint32_t java_map_index
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 u0x0200013b, ; uint32_t type_token_id
		i32 150; uint32_t java_map_index
	}, ; 42
	%struct.TypeMapModuleEntry {
		i32 u0x0200013d, ; uint32_t type_token_id
		i32 561; uint32_t java_map_index
	}, ; 43
	%struct.TypeMapModuleEntry {
		i32 u0x02000148, ; uint32_t type_token_id
		i32 337; uint32_t java_map_index
	}, ; 44
	%struct.TypeMapModuleEntry {
		i32 u0x0200014f, ; uint32_t type_token_id
		i32 784; uint32_t java_map_index
	}, ; 45
	%struct.TypeMapModuleEntry {
		i32 u0x0200015b, ; uint32_t type_token_id
		i32 907; uint32_t java_map_index
	}, ; 46
	%struct.TypeMapModuleEntry {
		i32 u0x0200015e, ; uint32_t type_token_id
		i32 43; uint32_t java_map_index
	}, ; 47
	%struct.TypeMapModuleEntry {
		i32 u0x02000162, ; uint32_t type_token_id
		i32 1022; uint32_t java_map_index
	}, ; 48
	%struct.TypeMapModuleEntry {
		i32 u0x02000164, ; uint32_t type_token_id
		i32 981; uint32_t java_map_index
	}, ; 49
	%struct.TypeMapModuleEntry {
		i32 u0x02000167, ; uint32_t type_token_id
		i32 750; uint32_t java_map_index
	}, ; 50
	%struct.TypeMapModuleEntry {
		i32 u0x0200016a, ; uint32_t type_token_id
		i32 486; uint32_t java_map_index
	}, ; 51
	%struct.TypeMapModuleEntry {
		i32 u0x0200016d, ; uint32_t type_token_id
		i32 939; uint32_t java_map_index
	}, ; 52
	%struct.TypeMapModuleEntry {
		i32 u0x0200016f, ; uint32_t type_token_id
		i32 1111; uint32_t java_map_index
	}, ; 53
	%struct.TypeMapModuleEntry {
		i32 u0x02000173, ; uint32_t type_token_id
		i32 473; uint32_t java_map_index
	}, ; 54
	%struct.TypeMapModuleEntry {
		i32 u0x02000179, ; uint32_t type_token_id
		i32 390; uint32_t java_map_index
	}, ; 55
	%struct.TypeMapModuleEntry {
		i32 u0x02000183, ; uint32_t type_token_id
		i32 99; uint32_t java_map_index
	}, ; 56
	%struct.TypeMapModuleEntry {
		i32 u0x02000185, ; uint32_t type_token_id
		i32 857; uint32_t java_map_index
	}, ; 57
	%struct.TypeMapModuleEntry {
		i32 u0x02000188, ; uint32_t type_token_id
		i32 4; uint32_t java_map_index
	}, ; 58
	%struct.TypeMapModuleEntry {
		i32 u0x0200018a, ; uint32_t type_token_id
		i32 778; uint32_t java_map_index
	}, ; 59
	%struct.TypeMapModuleEntry {
		i32 u0x0200018c, ; uint32_t type_token_id
		i32 936; uint32_t java_map_index
	}, ; 60
	%struct.TypeMapModuleEntry {
		i32 u0x0200018e, ; uint32_t type_token_id
		i32 979; uint32_t java_map_index
	}, ; 61
	%struct.TypeMapModuleEntry {
		i32 u0x02000196, ; uint32_t type_token_id
		i32 255; uint32_t java_map_index
	}, ; 62
	%struct.TypeMapModuleEntry {
		i32 u0x02000199, ; uint32_t type_token_id
		i32 177; uint32_t java_map_index
	}, ; 63
	%struct.TypeMapModuleEntry {
		i32 u0x0200019b, ; uint32_t type_token_id
		i32 887; uint32_t java_map_index
	}, ; 64
	%struct.TypeMapModuleEntry {
		i32 u0x0200019d, ; uint32_t type_token_id
		i32 1031; uint32_t java_map_index
	}, ; 65
	%struct.TypeMapModuleEntry {
		i32 u0x0200019f, ; uint32_t type_token_id
		i32 983; uint32_t java_map_index
	}, ; 66
	%struct.TypeMapModuleEntry {
		i32 u0x020001b0, ; uint32_t type_token_id
		i32 210; uint32_t java_map_index
	}, ; 67
	%struct.TypeMapModuleEntry {
		i32 u0x020001b3, ; uint32_t type_token_id
		i32 436; uint32_t java_map_index
	}, ; 68
	%struct.TypeMapModuleEntry {
		i32 u0x020001b4, ; uint32_t type_token_id
		i32 847; uint32_t java_map_index
	}, ; 69
	%struct.TypeMapModuleEntry {
		i32 u0x020001b6, ; uint32_t type_token_id
		i32 468; uint32_t java_map_index
	}, ; 70
	%struct.TypeMapModuleEntry {
		i32 u0x020001b8, ; uint32_t type_token_id
		i32 551; uint32_t java_map_index
	}, ; 71
	%struct.TypeMapModuleEntry {
		i32 u0x020001ba, ; uint32_t type_token_id
		i32 1128; uint32_t java_map_index
	}, ; 72
	%struct.TypeMapModuleEntry {
		i32 u0x020001c2, ; uint32_t type_token_id
		i32 0; uint32_t java_map_index
	}, ; 73
	%struct.TypeMapModuleEntry {
		i32 u0x020001c6, ; uint32_t type_token_id
		i32 839; uint32_t java_map_index
	}, ; 74
	%struct.TypeMapModuleEntry {
		i32 u0x020001ca, ; uint32_t type_token_id
		i32 213; uint32_t java_map_index
	}, ; 75
	%struct.TypeMapModuleEntry {
		i32 u0x020001ce, ; uint32_t type_token_id
		i32 93; uint32_t java_map_index
	}, ; 76
	%struct.TypeMapModuleEntry {
		i32 u0x020001d0, ; uint32_t type_token_id
		i32 581; uint32_t java_map_index
	}, ; 77
	%struct.TypeMapModuleEntry {
		i32 u0x020001d2, ; uint32_t type_token_id
		i32 108; uint32_t java_map_index
	}, ; 78
	%struct.TypeMapModuleEntry {
		i32 u0x020001d9, ; uint32_t type_token_id
		i32 383; uint32_t java_map_index
	}, ; 79
	%struct.TypeMapModuleEntry {
		i32 u0x020001de, ; uint32_t type_token_id
		i32 488; uint32_t java_map_index
	}, ; 80
	%struct.TypeMapModuleEntry {
		i32 u0x020001e1, ; uint32_t type_token_id
		i32 1064; uint32_t java_map_index
	}, ; 81
	%struct.TypeMapModuleEntry {
		i32 u0x020001e3, ; uint32_t type_token_id
		i32 909; uint32_t java_map_index
	}, ; 82
	%struct.TypeMapModuleEntry {
		i32 u0x020001e7, ; uint32_t type_token_id
		i32 400; uint32_t java_map_index
	}, ; 83
	%struct.TypeMapModuleEntry {
		i32 u0x020001e9, ; uint32_t type_token_id
		i32 737; uint32_t java_map_index
	}, ; 84
	%struct.TypeMapModuleEntry {
		i32 u0x020001ed, ; uint32_t type_token_id
		i32 644; uint32_t java_map_index
	}, ; 85
	%struct.TypeMapModuleEntry {
		i32 u0x020001f1, ; uint32_t type_token_id
		i32 914; uint32_t java_map_index
	}, ; 86
	%struct.TypeMapModuleEntry {
		i32 u0x020001f5, ; uint32_t type_token_id
		i32 443; uint32_t java_map_index
	}, ; 87
	%struct.TypeMapModuleEntry {
		i32 u0x0200020e, ; uint32_t type_token_id
		i32 1127; uint32_t java_map_index
	}, ; 88
	%struct.TypeMapModuleEntry {
		i32 u0x02000211, ; uint32_t type_token_id
		i32 334; uint32_t java_map_index
	}, ; 89
	%struct.TypeMapModuleEntry {
		i32 u0x02000214, ; uint32_t type_token_id
		i32 852; uint32_t java_map_index
	}, ; 90
	%struct.TypeMapModuleEntry {
		i32 u0x02000215, ; uint32_t type_token_id
		i32 774; uint32_t java_map_index
	}, ; 91
	%struct.TypeMapModuleEntry {
		i32 u0x02000218, ; uint32_t type_token_id
		i32 972; uint32_t java_map_index
	}, ; 92
	%struct.TypeMapModuleEntry {
		i32 u0x02000226, ; uint32_t type_token_id
		i32 273; uint32_t java_map_index
	}, ; 93
	%struct.TypeMapModuleEntry {
		i32 u0x02000228, ; uint32_t type_token_id
		i32 181; uint32_t java_map_index
	}, ; 94
	%struct.TypeMapModuleEntry {
		i32 u0x0200022b, ; uint32_t type_token_id
		i32 682; uint32_t java_map_index
	}, ; 95
	%struct.TypeMapModuleEntry {
		i32 u0x0200022d, ; uint32_t type_token_id
		i32 1027; uint32_t java_map_index
	}, ; 96
	%struct.TypeMapModuleEntry {
		i32 u0x02000230, ; uint32_t type_token_id
		i32 1130; uint32_t java_map_index
	}, ; 97
	%struct.TypeMapModuleEntry {
		i32 u0x02000232, ; uint32_t type_token_id
		i32 91; uint32_t java_map_index
	}, ; 98
	%struct.TypeMapModuleEntry {
		i32 u0x02000234, ; uint32_t type_token_id
		i32 1129; uint32_t java_map_index
	}, ; 99
	%struct.TypeMapModuleEntry {
		i32 u0x02000237, ; uint32_t type_token_id
		i32 878; uint32_t java_map_index
	}, ; 100
	%struct.TypeMapModuleEntry {
		i32 u0x0200023a, ; uint32_t type_token_id
		i32 783; uint32_t java_map_index
	}, ; 101
	%struct.TypeMapModuleEntry {
		i32 u0x0200023c, ; uint32_t type_token_id
		i32 313; uint32_t java_map_index
	}, ; 102
	%struct.TypeMapModuleEntry {
		i32 u0x0200023e, ; uint32_t type_token_id
		i32 269; uint32_t java_map_index
	}, ; 103
	%struct.TypeMapModuleEntry {
		i32 u0x02000240, ; uint32_t type_token_id
		i32 380; uint32_t java_map_index
	}, ; 104
	%struct.TypeMapModuleEntry {
		i32 u0x02000242, ; uint32_t type_token_id
		i32 137; uint32_t java_map_index
	}, ; 105
	%struct.TypeMapModuleEntry {
		i32 u0x02000244, ; uint32_t type_token_id
		i32 777; uint32_t java_map_index
	}, ; 106
	%struct.TypeMapModuleEntry {
		i32 u0x02000246, ; uint32_t type_token_id
		i32 664; uint32_t java_map_index
	}, ; 107
	%struct.TypeMapModuleEntry {
		i32 u0x02000249, ; uint32_t type_token_id
		i32 694; uint32_t java_map_index
	}, ; 108
	%struct.TypeMapModuleEntry {
		i32 u0x0200024a, ; uint32_t type_token_id
		i32 790; uint32_t java_map_index
	}, ; 109
	%struct.TypeMapModuleEntry {
		i32 u0x0200024c, ; uint32_t type_token_id
		i32 864; uint32_t java_map_index
	}, ; 110
	%struct.TypeMapModuleEntry {
		i32 u0x02000253, ; uint32_t type_token_id
		i32 963; uint32_t java_map_index
	}, ; 111
	%struct.TypeMapModuleEntry {
		i32 u0x0200025c, ; uint32_t type_token_id
		i32 56; uint32_t java_map_index
	}, ; 112
	%struct.TypeMapModuleEntry {
		i32 u0x02000260, ; uint32_t type_token_id
		i32 1122; uint32_t java_map_index
	}, ; 113
	%struct.TypeMapModuleEntry {
		i32 u0x0200026f, ; uint32_t type_token_id
		i32 80; uint32_t java_map_index
	}, ; 114
	%struct.TypeMapModuleEntry {
		i32 u0x02000276, ; uint32_t type_token_id
		i32 19; uint32_t java_map_index
	}, ; 115
	%struct.TypeMapModuleEntry {
		i32 u0x0200027a, ; uint32_t type_token_id
		i32 643; uint32_t java_map_index
	}, ; 116
	%struct.TypeMapModuleEntry {
		i32 u0x0200027b, ; uint32_t type_token_id
		i32 992; uint32_t java_map_index
	}, ; 117
	%struct.TypeMapModuleEntry {
		i32 u0x02000281, ; uint32_t type_token_id
		i32 635; uint32_t java_map_index
	}, ; 118
	%struct.TypeMapModuleEntry {
		i32 u0x02000285, ; uint32_t type_token_id
		i32 461; uint32_t java_map_index
	}, ; 119
	%struct.TypeMapModuleEntry {
		i32 u0x0200028d, ; uint32_t type_token_id
		i32 560; uint32_t java_map_index
	}, ; 120
	%struct.TypeMapModuleEntry {
		i32 u0x02000291, ; uint32_t type_token_id
		i32 1009; uint32_t java_map_index
	}, ; 121
	%struct.TypeMapModuleEntry {
		i32 u0x02000294, ; uint32_t type_token_id
		i32 1062; uint32_t java_map_index
	}, ; 122
	%struct.TypeMapModuleEntry {
		i32 u0x020002bd, ; uint32_t type_token_id
		i32 352; uint32_t java_map_index
	}, ; 123
	%struct.TypeMapModuleEntry {
		i32 u0x020002c3, ; uint32_t type_token_id
		i32 397; uint32_t java_map_index
	}, ; 124
	%struct.TypeMapModuleEntry {
		i32 u0x020002c8, ; uint32_t type_token_id
		i32 190; uint32_t java_map_index
	}, ; 125
	%struct.TypeMapModuleEntry {
		i32 u0x020002cc, ; uint32_t type_token_id
		i32 1126; uint32_t java_map_index
	}, ; 126
	%struct.TypeMapModuleEntry {
		i32 u0x020002e2, ; uint32_t type_token_id
		i32 999; uint32_t java_map_index
	}, ; 127
	%struct.TypeMapModuleEntry {
		i32 u0x02000313, ; uint32_t type_token_id
		i32 507; uint32_t java_map_index
	}, ; 128
	%struct.TypeMapModuleEntry {
		i32 u0x02000319, ; uint32_t type_token_id
		i32 744; uint32_t java_map_index
	}, ; 129
	%struct.TypeMapModuleEntry {
		i32 u0x0200031b, ; uint32_t type_token_id
		i32 1000; uint32_t java_map_index
	}, ; 130
	%struct.TypeMapModuleEntry {
		i32 u0x02000320, ; uint32_t type_token_id
		i32 399; uint32_t java_map_index
	}, ; 131
	%struct.TypeMapModuleEntry {
		i32 u0x02000326, ; uint32_t type_token_id
		i32 742; uint32_t java_map_index
	}, ; 132
	%struct.TypeMapModuleEntry {
		i32 u0x0200032c, ; uint32_t type_token_id
		i32 903; uint32_t java_map_index
	}, ; 133
	%struct.TypeMapModuleEntry {
		i32 u0x02000335, ; uint32_t type_token_id
		i32 524; uint32_t java_map_index
	}, ; 134
	%struct.TypeMapModuleEntry {
		i32 u0x0200033a, ; uint32_t type_token_id
		i32 416; uint32_t java_map_index
	}, ; 135
	%struct.TypeMapModuleEntry {
		i32 u0x0200033c, ; uint32_t type_token_id
		i32 226; uint32_t java_map_index
	}, ; 136
	%struct.TypeMapModuleEntry {
		i32 u0x0200033d, ; uint32_t type_token_id
		i32 1069; uint32_t java_map_index
	}, ; 137
	%struct.TypeMapModuleEntry {
		i32 u0x02000341, ; uint32_t type_token_id
		i32 709; uint32_t java_map_index
	}, ; 138
	%struct.TypeMapModuleEntry {
		i32 u0x02000344, ; uint32_t type_token_id
		i32 780; uint32_t java_map_index
	}, ; 139
	%struct.TypeMapModuleEntry {
		i32 u0x02000348, ; uint32_t type_token_id
		i32 149; uint32_t java_map_index
	}, ; 140
	%struct.TypeMapModuleEntry {
		i32 u0x0200034b, ; uint32_t type_token_id
		i32 701; uint32_t java_map_index
	}, ; 141
	%struct.TypeMapModuleEntry {
		i32 u0x0200034d, ; uint32_t type_token_id
		i32 510; uint32_t java_map_index
	}, ; 142
	%struct.TypeMapModuleEntry {
		i32 u0x02000350, ; uint32_t type_token_id
		i32 119; uint32_t java_map_index
	}, ; 143
	%struct.TypeMapModuleEntry {
		i32 u0x02000353, ; uint32_t type_token_id
		i32 548; uint32_t java_map_index
	}, ; 144
	%struct.TypeMapModuleEntry {
		i32 u0x02000357, ; uint32_t type_token_id
		i32 82; uint32_t java_map_index
	}, ; 145
	%struct.TypeMapModuleEntry {
		i32 u0x02000359, ; uint32_t type_token_id
		i32 681; uint32_t java_map_index
	}, ; 146
	%struct.TypeMapModuleEntry {
		i32 u0x0200035b, ; uint32_t type_token_id
		i32 918; uint32_t java_map_index
	}, ; 147
	%struct.TypeMapModuleEntry {
		i32 u0x0200036e, ; uint32_t type_token_id
		i32 710; uint32_t java_map_index
	}, ; 148
	%struct.TypeMapModuleEntry {
		i32 u0x0200037d, ; uint32_t type_token_id
		i32 469; uint32_t java_map_index
	}, ; 149
	%struct.TypeMapModuleEntry {
		i32 u0x02000381, ; uint32_t type_token_id
		i32 692; uint32_t java_map_index
	}, ; 150
	%struct.TypeMapModuleEntry {
		i32 u0x02000390, ; uint32_t type_token_id
		i32 1034; uint32_t java_map_index
	}, ; 151
	%struct.TypeMapModuleEntry {
		i32 u0x0200039a, ; uint32_t type_token_id
		i32 700; uint32_t java_map_index
	}, ; 152
	%struct.TypeMapModuleEntry {
		i32 u0x0200039c, ; uint32_t type_token_id
		i32 794; uint32_t java_map_index
	}, ; 153
	%struct.TypeMapModuleEntry {
		i32 u0x020003a0, ; uint32_t type_token_id
		i32 378; uint32_t java_map_index
	}, ; 154
	%struct.TypeMapModuleEntry {
		i32 u0x020003a6, ; uint32_t type_token_id
		i32 265; uint32_t java_map_index
	}, ; 155
	%struct.TypeMapModuleEntry {
		i32 u0x020003ac, ; uint32_t type_token_id
		i32 932; uint32_t java_map_index
	}, ; 156
	%struct.TypeMapModuleEntry {
		i32 u0x020003af, ; uint32_t type_token_id
		i32 597; uint32_t java_map_index
	}, ; 157
	%struct.TypeMapModuleEntry {
		i32 u0x020003b1, ; uint32_t type_token_id
		i32 437; uint32_t java_map_index
	}, ; 158
	%struct.TypeMapModuleEntry {
		i32 u0x020003b3, ; uint32_t type_token_id
		i32 412; uint32_t java_map_index
	}, ; 159
	%struct.TypeMapModuleEntry {
		i32 u0x020003b9, ; uint32_t type_token_id
		i32 79; uint32_t java_map_index
	}, ; 160
	%struct.TypeMapModuleEntry {
		i32 u0x020003bb, ; uint32_t type_token_id
		i32 996; uint32_t java_map_index
	}, ; 161
	%struct.TypeMapModuleEntry {
		i32 u0x020003be, ; uint32_t type_token_id
		i32 10; uint32_t java_map_index
	}, ; 162
	%struct.TypeMapModuleEntry {
		i32 u0x020003c0, ; uint32_t type_token_id
		i32 1081; uint32_t java_map_index
	}, ; 163
	%struct.TypeMapModuleEntry {
		i32 u0x020003c2, ; uint32_t type_token_id
		i32 236; uint32_t java_map_index
	}, ; 164
	%struct.TypeMapModuleEntry {
		i32 u0x020003c4, ; uint32_t type_token_id
		i32 1136; uint32_t java_map_index
	}, ; 165
	%struct.TypeMapModuleEntry {
		i32 u0x020003c6, ; uint32_t type_token_id
		i32 153; uint32_t java_map_index
	}, ; 166
	%struct.TypeMapModuleEntry {
		i32 u0x020003c8, ; uint32_t type_token_id
		i32 401; uint32_t java_map_index
	}, ; 167
	%struct.TypeMapModuleEntry {
		i32 u0x020003ce, ; uint32_t type_token_id
		i32 1142; uint32_t java_map_index
	}, ; 168
	%struct.TypeMapModuleEntry {
		i32 u0x020003d0, ; uint32_t type_token_id
		i32 1021; uint32_t java_map_index
	}, ; 169
	%struct.TypeMapModuleEntry {
		i32 u0x020003d4, ; uint32_t type_token_id
		i32 167; uint32_t java_map_index
	}, ; 170
	%struct.TypeMapModuleEntry {
		i32 u0x020003d6, ; uint32_t type_token_id
		i32 522; uint32_t java_map_index
	}, ; 171
	%struct.TypeMapModuleEntry {
		i32 u0x020003da, ; uint32_t type_token_id
		i32 1080; uint32_t java_map_index
	}, ; 172
	%struct.TypeMapModuleEntry {
		i32 u0x020003dc, ; uint32_t type_token_id
		i32 1086; uint32_t java_map_index
	}, ; 173
	%struct.TypeMapModuleEntry {
		i32 u0x020003de, ; uint32_t type_token_id
		i32 352; uint32_t java_map_index
	}, ; 174
	%struct.TypeMapModuleEntry {
		i32 u0x020003df, ; uint32_t type_token_id
		i32 352; uint32_t java_map_index
	}, ; 175
	%struct.TypeMapModuleEntry {
		i32 u0x020003e1, ; uint32_t type_token_id
		i32 420; uint32_t java_map_index
	}, ; 176
	%struct.TypeMapModuleEntry {
		i32 u0x020003e3, ; uint32_t type_token_id
		i32 302; uint32_t java_map_index
	}, ; 177
	%struct.TypeMapModuleEntry {
		i32 u0x020003e5, ; uint32_t type_token_id
		i32 112; uint32_t java_map_index
	}, ; 178
	%struct.TypeMapModuleEntry {
		i32 u0x020003e6, ; uint32_t type_token_id
		i32 42; uint32_t java_map_index
	}, ; 179
	%struct.TypeMapModuleEntry {
		i32 u0x020003e8, ; uint32_t type_token_id
		i32 465; uint32_t java_map_index
	}, ; 180
	%struct.TypeMapModuleEntry {
		i32 u0x020003ea, ; uint32_t type_token_id
		i32 879; uint32_t java_map_index
	}, ; 181
	%struct.TypeMapModuleEntry {
		i32 u0x020003ec, ; uint32_t type_token_id
		i32 483; uint32_t java_map_index
	}, ; 182
	%struct.TypeMapModuleEntry {
		i32 u0x020003ee, ; uint32_t type_token_id
		i32 769; uint32_t java_map_index
	}, ; 183
	%struct.TypeMapModuleEntry {
		i32 u0x020003f3, ; uint32_t type_token_id
		i32 283; uint32_t java_map_index
	}, ; 184
	%struct.TypeMapModuleEntry {
		i32 u0x020003f5, ; uint32_t type_token_id
		i32 83; uint32_t java_map_index
	}, ; 185
	%struct.TypeMapModuleEntry {
		i32 u0x020003f7, ; uint32_t type_token_id
		i32 931; uint32_t java_map_index
	}, ; 186
	%struct.TypeMapModuleEntry {
		i32 u0x020003f9, ; uint32_t type_token_id
		i32 765; uint32_t java_map_index
	}, ; 187
	%struct.TypeMapModuleEntry {
		i32 u0x020003fb, ; uint32_t type_token_id
		i32 384; uint32_t java_map_index
	}, ; 188
	%struct.TypeMapModuleEntry {
		i32 u0x020003fd, ; uint32_t type_token_id
		i32 1133; uint32_t java_map_index
	}, ; 189
	%struct.TypeMapModuleEntry {
		i32 u0x020003ff, ; uint32_t type_token_id
		i32 957; uint32_t java_map_index
	}, ; 190
	%struct.TypeMapModuleEntry {
		i32 u0x02000401, ; uint32_t type_token_id
		i32 556; uint32_t java_map_index
	}, ; 191
	%struct.TypeMapModuleEntry {
		i32 u0x02000403, ; uint32_t type_token_id
		i32 146; uint32_t java_map_index
	}, ; 192
	%struct.TypeMapModuleEntry {
		i32 u0x02000405, ; uint32_t type_token_id
		i32 402; uint32_t java_map_index
	}, ; 193
	%struct.TypeMapModuleEntry {
		i32 u0x02000408, ; uint32_t type_token_id
		i32 818; uint32_t java_map_index
	}, ; 194
	%struct.TypeMapModuleEntry {
		i32 u0x02000420, ; uint32_t type_token_id
		i32 115; uint32_t java_map_index
	}, ; 195
	%struct.TypeMapModuleEntry {
		i32 u0x02000422, ; uint32_t type_token_id
		i32 639; uint32_t java_map_index
	}, ; 196
	%struct.TypeMapModuleEntry {
		i32 u0x02000425, ; uint32_t type_token_id
		i32 316; uint32_t java_map_index
	}, ; 197
	%struct.TypeMapModuleEntry {
		i32 u0x02000427, ; uint32_t type_token_id
		i32 3; uint32_t java_map_index
	}, ; 198
	%struct.TypeMapModuleEntry {
		i32 u0x02000428, ; uint32_t type_token_id
		i32 203; uint32_t java_map_index
	}, ; 199
	%struct.TypeMapModuleEntry {
		i32 u0x0200042b, ; uint32_t type_token_id
		i32 306; uint32_t java_map_index
	}, ; 200
	%struct.TypeMapModuleEntry {
		i32 u0x0200042d, ; uint32_t type_token_id
		i32 632; uint32_t java_map_index
	}, ; 201
	%struct.TypeMapModuleEntry {
		i32 u0x02000432, ; uint32_t type_token_id
		i32 498; uint32_t java_map_index
	}, ; 202
	%struct.TypeMapModuleEntry {
		i32 u0x02000437, ; uint32_t type_token_id
		i32 917; uint32_t java_map_index
	}, ; 203
	%struct.TypeMapModuleEntry {
		i32 u0x0200043e, ; uint32_t type_token_id
		i32 280; uint32_t java_map_index
	} ; 204
], align 4

@module32_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000003, ; uint32_t type_token_id
		i32 89; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000004, ; uint32_t type_token_id
		i32 805; uint32_t java_map_index
	} ; 1
], align 4

@module32_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000005, ; uint32_t type_token_id
		i32 805; uint32_t java_map_index
	} ; 0
], align 4

@module33_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000008, ; uint32_t type_token_id
		i32 844; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000009, ; uint32_t type_token_id
		i32 731; uint32_t java_map_index
	} ; 1
], align 4

@module34_managed_to_java = internal dso_local constant [24 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 808; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 111; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 978; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 590; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 1135; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 152; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 725; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 489; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000020, ; uint32_t type_token_id
		i32 460; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000021, ; uint32_t type_token_id
		i32 6; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000023, ; uint32_t type_token_id
		i32 432; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x02000025, ; uint32_t type_token_id
		i32 1144; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x02000027, ; uint32_t type_token_id
		i32 631; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000028, ; uint32_t type_token_id
		i32 13; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000029, ; uint32_t type_token_id
		i32 629; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 1032; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 576; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 869; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200002f, ; uint32_t type_token_id
		i32 511; uint32_t java_map_index
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 u0x02000031, ; uint32_t type_token_id
		i32 339; uint32_t java_map_index
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 u0x02000033, ; uint32_t type_token_id
		i32 324; uint32_t java_map_index
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 u0x02000035, ; uint32_t type_token_id
		i32 577; uint32_t java_map_index
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 u0x02000037, ; uint32_t type_token_id
		i32 462; uint32_t java_map_index
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 u0x02000039, ; uint32_t type_token_id
		i32 1026; uint32_t java_map_index
	} ; 23
], align 4

@module34_managed_to_java_duplicates = internal dso_local constant [19 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 808; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 111; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 978; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 590; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000019, ; uint32_t type_token_id
		i32 1135; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 152; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 725; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200001f, ; uint32_t type_token_id
		i32 489; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000022, ; uint32_t type_token_id
		i32 6; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000024, ; uint32_t type_token_id
		i32 432; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000026, ; uint32_t type_token_id
		i32 1144; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 576; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200002e, ; uint32_t type_token_id
		i32 869; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 511; uint32_t java_map_index
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 u0x02000032, ; uint32_t type_token_id
		i32 339; uint32_t java_map_index
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 324; uint32_t java_map_index
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 u0x02000036, ; uint32_t type_token_id
		i32 577; uint32_t java_map_index
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 462; uint32_t java_map_index
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 1026; uint32_t java_map_index
	} ; 18
], align 4

@module35_managed_to_java = internal dso_local constant [7 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 829; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 921; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 411; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000011, ; uint32_t type_token_id
		i32 532; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000012, ; uint32_t type_token_id
		i32 1147; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000013, ; uint32_t type_token_id
		i32 60; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 1007; uint32_t java_map_index
	} ; 6
], align 4

@module35_managed_to_java_duplicates = internal dso_local constant [5 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 921; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000010, ; uint32_t type_token_id
		i32 411; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x02000014, ; uint32_t type_token_id
		i32 60; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x02000015, ; uint32_t type_token_id
		i32 1147; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 532; uint32_t java_map_index
	} ; 4
], align 4

@module36_managed_to_java = internal dso_local constant [4 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000016, ; uint32_t type_token_id
		i32 297; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x02000017, ; uint32_t type_token_id
		i32 990; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 845; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 263; uint32_t java_map_index
	} ; 3
], align 4

@module36_managed_to_java_duplicates = internal dso_local constant [1 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000018, ; uint32_t type_token_id
		i32 990; uint32_t java_map_index
	} ; 0
], align 4

@module37_managed_to_java = internal dso_local constant [14 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x02000006, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 342; uint32_t java_map_index
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 2; uint32_t java_map_index
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 1052; uint32_t java_map_index
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 u0x02000030, ; uint32_t type_token_id
		i32 160; uint32_t java_map_index
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 u0x02000034, ; uint32_t type_token_id
		i32 814; uint32_t java_map_index
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 u0x02000038, ; uint32_t type_token_id
		i32 148; uint32_t java_map_index
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 686; uint32_t java_map_index
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 u0x02000040, ; uint32_t type_token_id
		i32 623; uint32_t java_map_index
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 u0x02000044, ; uint32_t type_token_id
		i32 708; uint32_t java_map_index
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 u0x02000048, ; uint32_t type_token_id
		i32 102; uint32_t java_map_index
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 266; uint32_t java_map_index
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 506; uint32_t java_map_index
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 u0x02000094, ; uint32_t type_token_id
		i32 28; uint32_t java_map_index
	} ; 13
], align 4

@module37_managed_to_java_duplicates = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 u0x0200000a, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 61; uint32_t java_map_index
	} ; 1
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [1150 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 159; uint32_t java_name_index
	}, ; 0
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e0, ; uint32_t type_token_id
		i32 748; uint32_t java_name_index
	}, ; 1
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000415, ; uint32_t type_token_id
		i32 469; uint32_t java_name_index
	}, ; 2
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 482; uint32_t java_name_index
	}, ; 3
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 119; uint32_t java_name_index
	}, ; 4
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000053, ; uint32_t type_token_id
		i32 1043; uint32_t java_name_index
	}, ; 5
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1112; uint32_t java_name_index
	}, ; 6
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000025, ; uint32_t type_token_id
		i32 1081; uint32_t java_name_index
	}, ; 7
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 70; uint32_t java_name_index
	}, ; 8
	%struct.TypeMapJava {
		i32 23, ; uint32_t module_index
		i32 u0x02000007, ; uint32_t type_token_id
		i32 1010; uint32_t java_name_index
	}, ; 9
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003bd, ; uint32_t type_token_id
		i32 415; uint32_t java_name_index
	}, ; 10
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200036d, ; uint32_t type_token_id
		i32 368; uint32_t java_name_index
	}, ; 11
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000eb, ; uint32_t type_token_id
		i32 31; uint32_t java_name_index
	}, ; 12
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x02000028, ; uint32_t type_token_id
		i32 1116; uint32_t java_name_index
	}, ; 13
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000054, ; uint32_t type_token_id
		i32 952; uint32_t java_name_index
	}, ; 14
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 681; uint32_t java_name_index
	}, ; 15
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 813; uint32_t java_name_index
	}, ; 16
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f5, ; uint32_t type_token_id
		i32 758; uint32_t java_name_index
	}, ; 17
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 641; uint32_t java_name_index
	}, ; 18
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200026b, ; uint32_t type_token_id
		i32 232; uint32_t java_name_index
	}, ; 19
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1065; uint32_t java_name_index
	}, ; 20
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 806; uint32_t java_name_index
	}, ; 21
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000048, ; uint32_t type_token_id
		i32 525; uint32_t java_name_index
	}, ; 22
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003cc, ; uint32_t type_token_id
		i32 424; uint32_t java_name_index
	}, ; 23
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000382, ; uint32_t type_token_id
		i32 380; uint32_t java_name_index
	}, ; 24
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 945; uint32_t java_name_index
	}, ; 25
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 673; uint32_t java_name_index
	}, ; 26
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000282, ; uint32_t type_token_id
		i32 244; uint32_t java_name_index
	}, ; 27
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x02000094, ; uint32_t type_token_id
		i32 1149; uint32_t java_name_index
	}, ; 28
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002ed, ; uint32_t type_token_id
		i32 278; uint32_t java_name_index
	}, ; 29
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200014d, ; uint32_t type_token_id
		i32 86; uint32_t java_name_index
	}, ; 30
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 526; uint32_t java_name_index
	}, ; 31
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 1097; uint32_t java_name_index
	}, ; 32
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000306, ; uint32_t type_token_id
		i32 302; uint32_t java_name_index
	}, ; 33
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000e1, ; uint32_t type_token_id
		i32 25; uint32_t java_name_index
	}, ; 34
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 699; uint32_t java_name_index
	}, ; 35
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000012, ; uint32_t type_token_id
		i32 504; uint32_t java_name_index
	}, ; 36
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200001f, ; uint32_t type_token_id
		i32 512; uint32_t java_name_index
	}, ; 37
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000621, ; uint32_t type_token_id
		i32 868; uint32_t java_name_index
	}, ; 38
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 10; uint32_t java_name_index
	}, ; 39
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000209, ; uint32_t type_token_id
		i32 188; uint32_t java_name_index
	}, ; 40
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000191, ; uint32_t type_token_id
		i32 125; uint32_t java_name_index
	}, ; 41
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 435; uint32_t java_name_index
	}, ; 42
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 96; uint32_t java_name_index
	}, ; 43
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 838; uint32_t java_name_index
	}, ; 44
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 517; uint32_t java_name_index
	}, ; 45
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000629, ; uint32_t type_token_id
		i32 872; uint32_t java_name_index
	}, ; 46
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000037, ; uint32_t type_token_id
		i32 1091; uint32_t java_name_index
	}, ; 47
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 510; uint32_t java_name_index
	}, ; 48
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 795; uint32_t java_name_index
	}, ; 49
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003c1, ; uint32_t type_token_id
		i32 903; uint32_t java_name_index
	}, ; 50
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000397, ; uint32_t type_token_id
		i32 388; uint32_t java_name_index
	}, ; 51
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000062, ; uint32_t type_token_id
		i32 539; uint32_t java_name_index
	}, ; 52
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ab, ; uint32_t type_token_id
		i32 722; uint32_t java_name_index
	}, ; 53
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200042e, ; uint32_t type_token_id
		i32 485; uint32_t java_name_index
	}, ; 54
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 19; uint32_t java_name_index
	}, ; 55
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200025b, ; uint32_t type_token_id
		i32 225; uint32_t java_name_index
	}, ; 56
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 538; uint32_t java_name_index
	}, ; 57
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1027; uint32_t java_name_index
	}, ; 58
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000628, ; uint32_t type_token_id
		i32 871; uint32_t java_name_index
	}, ; 59
	%struct.TypeMapJava {
		i32 35, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1132; uint32_t java_name_index
	}, ; 60
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1138; uint32_t java_name_index
	}, ; 61
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200018c, ; uint32_t type_token_id
		i32 713; uint32_t java_name_index
	}, ; 62
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000013, ; uint32_t type_token_id
		i32 665; uint32_t java_name_index
	}, ; 63
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 819; uint32_t java_name_index
	}, ; 64
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003dc, ; uint32_t type_token_id
		i32 919; uint32_t java_name_index
	}, ; 65
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b9, ; uint32_t type_token_id
		i32 582; uint32_t java_name_index
	}, ; 66
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 785; uint32_t java_name_index
	}, ; 67
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000019, ; uint32_t type_token_id
		i32 790; uint32_t java_name_index
	}, ; 68
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200010b, ; uint32_t type_token_id
		i32 48; uint32_t java_name_index
	}, ; 69
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000307, ; uint32_t type_token_id
		i32 303; uint32_t java_name_index
	}, ; 70
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000438, ; uint32_t type_token_id
		i32 493; uint32_t java_name_index
	}, ; 71
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000019, ; uint32_t type_token_id
		i32 671; uint32_t java_name_index
	}, ; 72
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 27; uint32_t java_name_index
	}, ; 73
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200027c, ; uint32_t type_token_id
		i32 239; uint32_t java_name_index
	}, ; 74
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000ba, ; uint32_t type_token_id
		i32 3; uint32_t java_name_index
	}, ; 75
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000d7, ; uint32_t type_token_id
		i32 21; uint32_t java_name_index
	}, ; 76
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 909; uint32_t java_name_index
	}, ; 77
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b0, ; uint32_t type_token_id
		i32 577; uint32_t java_name_index
	}, ; 78
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003b8, ; uint32_t type_token_id
		i32 412; uint32_t java_name_index
	}, ; 79
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 235; uint32_t java_name_index
	}, ; 80
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003d8, ; uint32_t type_token_id
		i32 916; uint32_t java_name_index
	}, ; 81
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 356; uint32_t java_name_index
	}, ; 82
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 446; uint32_t java_name_index
	}, ; 83
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003b1, ; uint32_t type_token_id
		i32 888; uint32_t java_name_index
	}, ; 84
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 780; uint32_t java_name_index
	}, ; 85
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001dd, ; uint32_t type_token_id
		i32 745; uint32_t java_name_index
	}, ; 86
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200037d, ; uint32_t type_token_id
		i32 852; uint32_t java_name_index
	}, ; 87
	%struct.TypeMapJava {
		i32 20, ; uint32_t module_index
		i32 u0x02000022, ; uint32_t type_token_id
		i32 991; uint32_t java_name_index
	}, ; 88
	%struct.TypeMapJava {
		i32 32, ; uint32_t module_index
		i32 u0x02000003, ; uint32_t type_token_id
		i32 1099; uint32_t java_name_index
	}, ; 89
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000638, ; uint32_t type_token_id
		i32 913; uint32_t java_name_index
	}, ; 90
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 209; uint32_t java_name_index
	}, ; 91
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000088, ; uint32_t type_token_id
		i32 636; uint32_t java_name_index
	}, ; 92
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001c0, ; uint32_t type_token_id
		i32 158; uint32_t java_name_index
	}, ; 93
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 798; uint32_t java_name_index
	}, ; 94
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a6, ; uint32_t type_token_id
		i32 570; uint32_t java_name_index
	}, ; 95
	%struct.TypeMapJava {
		i32 26, ; uint32_t module_index
		i32 u0x02000007, ; uint32_t type_token_id
		i32 1035; uint32_t java_name_index
	}, ; 96
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 40; uint32_t java_name_index
	}, ; 97
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000d0, ; uint32_t type_token_id
		i32 16; uint32_t java_name_index
	}, ; 98
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000182, ; uint32_t type_token_id
		i32 116; uint32_t java_name_index
	}, ; 99
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000048, ; uint32_t type_token_id
		i32 943; uint32_t java_name_index
	}, ; 100
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200026c, ; uint32_t type_token_id
		i32 233; uint32_t java_name_index
	}, ; 101
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x02000048, ; uint32_t type_token_id
		i32 1146; uint32_t java_name_index
	}, ; 102
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 700; uint32_t java_name_index
	}, ; 103
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000615, ; uint32_t type_token_id
		i32 854; uint32_t java_name_index
	}, ; 104
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200041c, ; uint32_t type_token_id
		i32 475; uint32_t java_name_index
	}, ; 105
	%struct.TypeMapJava {
		i32 23, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1012; uint32_t java_name_index
	}, ; 106
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001cc, ; uint32_t type_token_id
		i32 731; uint32_t java_name_index
	}, ; 107
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 166; uint32_t java_name_index
	}, ; 108
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000414, ; uint32_t type_token_id
		i32 468; uint32_t java_name_index
	}, ; 109
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000153, ; uint32_t type_token_id
		i32 91; uint32_t java_name_index
	}, ; 110
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1104; uint32_t java_name_index
	}, ; 111
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 438; uint32_t java_name_index
	}, ; 112
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200039d, ; uint32_t type_token_id
		i32 392; uint32_t java_name_index
	}, ; 113
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000099, ; uint32_t type_token_id
		i32 1077; uint32_t java_name_index
	}, ; 114
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200041f, ; uint32_t type_token_id
		i32 478; uint32_t java_name_index
	}, ; 115
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000014, ; uint32_t type_token_id
		i32 788; uint32_t java_name_index
	}, ; 116
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1095; uint32_t java_name_index
	}, ; 117
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002e0, ; uint32_t type_token_id
		i32 269; uint32_t java_name_index
	}, ; 118
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 351; uint32_t java_name_index
	}, ; 119
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000393, ; uint32_t type_token_id
		i32 385; uint32_t java_name_index
	}, ; 120
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 1085; uint32_t java_name_index
	}, ; 121
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 949; uint32_t java_name_index
	}, ; 122
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000433, ; uint32_t type_token_id
		i32 489; uint32_t java_name_index
	}, ; 123
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 1051; uint32_t java_name_index
	}, ; 124
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000056, ; uint32_t type_token_id
		i32 1046; uint32_t java_name_index
	}, ; 125
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 801; uint32_t java_name_index
	}, ; 126
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d4, ; uint32_t type_token_id
		i32 739; uint32_t java_name_index
	}, ; 127
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 545; uint32_t java_name_index
	}, ; 128
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001de, ; uint32_t type_token_id
		i32 746; uint32_t java_name_index
	}, ; 129
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000069, ; uint32_t type_token_id
		i32 1058; uint32_t java_name_index
	}, ; 130
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000409, ; uint32_t type_token_id
		i32 457; uint32_t java_name_index
	}, ; 131
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003bd, ; uint32_t type_token_id
		i32 899; uint32_t java_name_index
	}, ; 132
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000641, ; uint32_t type_token_id
		i32 923; uint32_t java_name_index
	}, ; 133
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200026d, ; uint32_t type_token_id
		i32 234; uint32_t java_name_index
	}, ; 134
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003cd, ; uint32_t type_token_id
		i32 907; uint32_t java_name_index
	}, ; 135
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000061, ; uint32_t type_token_id
		i32 821; uint32_t java_name_index
	}, ; 136
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 216; uint32_t java_name_index
	}, ; 137
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 1076; uint32_t java_name_index
	}, ; 138
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001bd, ; uint32_t type_token_id
		i32 157; uint32_t java_name_index
	}, ; 139
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 691; uint32_t java_name_index
	}, ; 140
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000396, ; uint32_t type_token_id
		i32 387; uint32_t java_name_index
	}, ; 141
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002d7, ; uint32_t type_token_id
		i32 268; uint32_t java_name_index
	}, ; 142
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000191, ; uint32_t type_token_id
		i32 718; uint32_t java_name_index
	}, ; 143
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x02000047, ; uint32_t type_token_id
		i32 1000; uint32_t java_name_index
	}, ; 144
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000318, ; uint32_t type_token_id
		i32 318; uint32_t java_name_index
	}, ; 145
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 453; uint32_t java_name_index
	}, ; 146
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a4, ; uint32_t type_token_id
		i32 139; uint32_t java_name_index
	}, ; 147
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 1142; uint32_t java_name_index
	}, ; 148
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 347; uint32_t java_name_index
	}, ; 149
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 74; uint32_t java_name_index
	}, ; 150
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003d9, ; uint32_t type_token_id
		i32 917; uint32_t java_name_index
	}, ; 151
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1108; uint32_t java_name_index
	}, ; 152
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003c5, ; uint32_t type_token_id
		i32 419; uint32_t java_name_index
	}, ; 153
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001fd, ; uint32_t type_token_id
		i32 761; uint32_t java_name_index
	}, ; 154
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000129, ; uint32_t type_token_id
		i32 62; uint32_t java_name_index
	}, ; 155
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200042f, ; uint32_t type_token_id
		i32 486; uint32_t java_name_index
	}, ; 156
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000045, ; uint32_t type_token_id
		i32 522; uint32_t java_name_index
	}, ; 157
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 680; uint32_t java_name_index
	}, ; 158
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 501; uint32_t java_name_index
	}, ; 159
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x02000030, ; uint32_t type_token_id
		i32 1140; uint32_t java_name_index
	}, ; 160
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200020c, ; uint32_t type_token_id
		i32 191; uint32_t java_name_index
	}, ; 161
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003c0, ; uint32_t type_token_id
		i32 902; uint32_t java_name_index
	}, ; 162
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001ac, ; uint32_t type_token_id
		i32 146; uint32_t java_name_index
	}, ; 163
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020006ab, ; uint32_t type_token_id
		i32 842; uint32_t java_name_index
	}, ; 164
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000337, ; uint32_t type_token_id
		i32 825; uint32_t java_name_index
	}, ; 165
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003bc, ; uint32_t type_token_id
		i32 414; uint32_t java_name_index
	}, ; 166
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 429; uint32_t java_name_index
	}, ; 167
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000295, ; uint32_t type_token_id
		i32 253; uint32_t java_name_index
	}, ; 168
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 658; uint32_t java_name_index
	}, ; 169
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000083, ; uint32_t type_token_id
		i32 1071; uint32_t java_name_index
	}, ; 170
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 968; uint32_t java_name_index
	}, ; 171
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003aa, ; uint32_t type_token_id
		i32 402; uint32_t java_name_index
	}, ; 172
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001db, ; uint32_t type_token_id
		i32 743; uint32_t java_name_index
	}, ; 173
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200034d, ; uint32_t type_token_id
		i32 833; uint32_t java_name_index
	}, ; 174
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001d6, ; uint32_t type_token_id
		i32 170; uint32_t java_name_index
	}, ; 175
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000084, ; uint32_t type_token_id
		i32 973; uint32_t java_name_index
	}, ; 176
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 131; uint32_t java_name_index
	}, ; 177
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200038e, ; uint32_t type_token_id
		i32 382; uint32_t java_name_index
	}, ; 178
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200009e, ; uint32_t type_token_id
		i32 564; uint32_t java_name_index
	}, ; 179
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000088, ; uint32_t type_token_id
		i32 1075; uint32_t java_name_index
	}, ; 180
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 205; uint32_t java_name_index
	}, ; 181
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000027, ; uint32_t type_token_id
		i32 1083; uint32_t java_name_index
	}, ; 182
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 778; uint32_t java_name_index
	}, ; 183
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000346, ; uint32_t type_token_id
		i32 772; uint32_t java_name_index
	}, ; 184
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000046, ; uint32_t type_token_id
		i32 1092; uint32_t java_name_index
	}, ; 185
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 605; uint32_t java_name_index
	}, ; 186
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000037, ; uint32_t type_token_id
		i32 932; uint32_t java_name_index
	}, ; 187
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 621; uint32_t java_name_index
	}, ; 188
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 815; uint32_t java_name_index
	}, ; 189
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002c7, ; uint32_t type_token_id
		i32 264; uint32_t java_name_index
	}, ; 190
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020003a4, ; uint32_t type_token_id
		i32 777; uint32_t java_name_index
	}, ; 191
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000057, ; uint32_t type_token_id
		i32 609; uint32_t java_name_index
	}, ; 192
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200031d, ; uint32_t type_token_id
		i32 321; uint32_t java_name_index
	}, ; 193
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 876; uint32_t java_name_index
	}, ; 194
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003b9, ; uint32_t type_token_id
		i32 895; uint32_t java_name_index
	}, ; 195
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000050, ; uint32_t type_token_id
		i32 950; uint32_t java_name_index
	}, ; 196
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x020000a7, ; uint32_t type_token_id
		i32 659; uint32_t java_name_index
	}, ; 197
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002fa, ; uint32_t type_token_id
		i32 291; uint32_t java_name_index
	}, ; 198
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000192, ; uint32_t type_token_id
		i32 126; uint32_t java_name_index
	}, ; 199
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 528; uint32_t java_name_index
	}, ; 200
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200018b, ; uint32_t type_token_id
		i32 712; uint32_t java_name_index
	}, ; 201
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000054, ; uint32_t type_token_id
		i32 534; uint32_t java_name_index
	}, ; 202
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 466; uint32_t java_name_index
	}, ; 203
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003d7, ; uint32_t type_token_id
		i32 431; uint32_t java_name_index
	}, ; 204
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000322, ; uint32_t type_token_id
		i32 324; uint32_t java_name_index
	}, ; 205
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000059, ; uint32_t type_token_id
		i32 954; uint32_t java_name_index
	}, ; 206
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 879; uint32_t java_name_index
	}, ; 207
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000413, ; uint32_t type_token_id
		i32 467; uint32_t java_name_index
	}, ; 208
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200008b, ; uint32_t type_token_id
		i32 639; uint32_t java_name_index
	}, ; 209
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 149; uint32_t java_name_index
	}, ; 210
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200041b, ; uint32_t type_token_id
		i32 474; uint32_t java_name_index
	}, ; 211
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000398, ; uint32_t type_token_id
		i32 389; uint32_t java_name_index
	}, ; 212
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 164; uint32_t java_name_index
	}, ; 213
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 594; uint32_t java_name_index
	}, ; 214
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000036, ; uint32_t type_token_id
		i32 931; uint32_t java_name_index
	}, ; 215
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f2, ; uint32_t type_token_id
		i32 756; uint32_t java_name_index
	}, ; 216
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 610; uint32_t java_name_index
	}, ; 217
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1020; uint32_t java_name_index
	}, ; 218
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000435, ; uint32_t type_token_id
		i32 491; uint32_t java_name_index
	}, ; 219
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001c4, ; uint32_t type_token_id
		i32 725; uint32_t java_name_index
	}, ; 220
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200035e, ; uint32_t type_token_id
		i32 359; uint32_t java_name_index
	}, ; 221
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000079, ; uint32_t type_token_id
		i32 549; uint32_t java_name_index
	}, ; 222
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002e5, ; uint32_t type_token_id
		i32 273; uint32_t java_name_index
	}, ; 223
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000392, ; uint32_t type_token_id
		i32 384; uint32_t java_name_index
	}, ; 224
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 11; uint32_t java_name_index
	}, ; 225
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200033b, ; uint32_t type_token_id
		i32 341; uint32_t java_name_index
	}, ; 226
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000418, ; uint32_t type_token_id
		i32 472; uint32_t java_name_index
	}, ; 227
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200039f, ; uint32_t type_token_id
		i32 883; uint32_t java_name_index
	}, ; 228
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000049, ; uint32_t type_token_id
		i32 599; uint32_t java_name_index
	}, ; 229
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000066, ; uint32_t type_token_id
		i32 617; uint32_t java_name_index
	}, ; 230
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 38; uint32_t java_name_index
	}, ; 231
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x02000007, ; uint32_t type_token_id
		i32 685; uint32_t java_name_index
	}, ; 232
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 648; uint32_t java_name_index
	}, ; 233
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000339, ; uint32_t type_token_id
		i32 827; uint32_t java_name_index
	}, ; 234
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000073, ; uint32_t type_token_id
		i32 1063; uint32_t java_name_index
	}, ; 235
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003c1, ; uint32_t type_token_id
		i32 417; uint32_t java_name_index
	}, ; 236
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002ea, ; uint32_t type_token_id
		i32 275; uint32_t java_name_index
	}, ; 237
	%struct.TypeMapJava {
		i32 20, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 994; uint32_t java_name_index
	}, ; 238
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000086, ; uint32_t type_token_id
		i32 634; uint32_t java_name_index
	}, ; 239
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 551; uint32_t java_name_index
	}, ; 240
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e7, ; uint32_t type_token_id
		i32 751; uint32_t java_name_index
	}, ; 241
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1059; uint32_t java_name_index
	}, ; 242
	%struct.TypeMapJava {
		i32 24, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1019; uint32_t java_name_index
	}, ; 243
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200017e, ; uint32_t type_token_id
		i32 112; uint32_t java_name_index
	}, ; 244
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000190, ; uint32_t type_token_id
		i32 717; uint32_t java_name_index
	}, ; 245
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200017d, ; uint32_t type_token_id
		i32 111; uint32_t java_name_index
	}, ; 246
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 571; uint32_t java_name_index
	}, ; 247
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 972; uint32_t java_name_index
	}, ; 248
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200034e, ; uint32_t type_token_id
		i32 834; uint32_t java_name_index
	}, ; 249
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200012e, ; uint32_t type_token_id
		i32 66; uint32_t java_name_index
	}, ; 250
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index
		i32 u0x02000009, ; uint32_t type_token_id
		i32 784; uint32_t java_name_index
	}, ; 251
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000303, ; uint32_t type_token_id
		i32 299; uint32_t java_name_index
	}, ; 252
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200006f, ; uint32_t type_token_id
		i32 962; uint32_t java_name_index
	}, ; 253
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000048, ; uint32_t type_token_id
		i32 598; uint32_t java_name_index
	}, ; 254
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000195, ; uint32_t type_token_id
		i32 129; uint32_t java_name_index
	}, ; 255
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003ca, ; uint32_t type_token_id
		i32 422; uint32_t java_name_index
	}, ; 256
	%struct.TypeMapJava {
		i32 13, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 783; uint32_t java_name_index
	}, ; 257
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200018e, ; uint32_t type_token_id
		i32 715; uint32_t java_name_index
	}, ; 258
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f0, ; uint32_t type_token_id
		i32 281; uint32_t java_name_index
	}, ; 259
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000046, ; uint32_t type_token_id
		i32 523; uint32_t java_name_index
	}, ; 260
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000050, ; uint32_t type_token_id
		i32 1041; uint32_t java_name_index
	}, ; 261
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000128, ; uint32_t type_token_id
		i32 61; uint32_t java_name_index
	}, ; 262
	%struct.TypeMapJava {
		i32 36, ; uint32_t module_index
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 1137; uint32_t java_name_index
	}, ; 263
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200027f, ; uint32_t type_token_id
		i32 242; uint32_t java_name_index
	}, ; 264
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003a5, ; uint32_t type_token_id
		i32 398; uint32_t java_name_index
	}, ; 265
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 1147; uint32_t java_name_index
	}, ; 266
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000f3, ; uint32_t type_token_id
		i32 37; uint32_t java_name_index
	}, ; 267
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000362, ; uint32_t type_token_id
		i32 362; uint32_t java_name_index
	}, ; 268
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 214; uint32_t java_name_index
	}, ; 269
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f0, ; uint32_t type_token_id
		i32 755; uint32_t java_name_index
	}, ; 270
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000160, ; uint32_t type_token_id
		i32 97; uint32_t java_name_index
	}, ; 271
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000029, ; uint32_t type_token_id
		i32 1084; uint32_t java_name_index
	}, ; 272
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 204; uint32_t java_name_index
	}, ; 273
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000329, ; uint32_t type_token_id
		i32 329; uint32_t java_name_index
	}, ; 274
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000115, ; uint32_t type_token_id
		i32 53; uint32_t java_name_index
	}, ; 275
	%struct.TypeMapJava {
		i32 20, ; uint32_t module_index
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 989; uint32_t java_name_index
	}, ; 276
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200036a, ; uint32_t type_token_id
		i32 845; uint32_t java_name_index
	}, ; 277
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000f1, ; uint32_t type_token_id
		i32 36; uint32_t java_name_index
	}, ; 278
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000018, ; uint32_t type_token_id
		i32 789; uint32_t java_name_index
	}, ; 279
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 498; uint32_t java_name_index
	}, ; 280
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001c8, ; uint32_t type_token_id
		i32 163; uint32_t java_name_index
	}, ; 281
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000088, ; uint32_t type_token_id
		i32 556; uint32_t java_name_index
	}, ; 282
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 445; uint32_t java_name_index
	}, ; 283
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000067, ; uint32_t type_token_id
		i32 1057; uint32_t java_name_index
	}, ; 284
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 622; uint32_t java_name_index
	}, ; 285
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x02000010, ; uint32_t type_token_id
		i32 786; uint32_t java_name_index
	}, ; 286
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000cb, ; uint32_t type_token_id
		i32 12; uint32_t java_name_index
	}, ; 287
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200063e, ; uint32_t type_token_id
		i32 920; uint32_t java_name_index
	}, ; 288
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 51; uint32_t java_name_index
	}, ; 289
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000083, ; uint32_t type_token_id
		i32 554; uint32_t java_name_index
	}, ; 290
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001e5, ; uint32_t type_token_id
		i32 178; uint32_t java_name_index
	}, ; 291
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000172, ; uint32_t type_token_id
		i32 105; uint32_t java_name_index
	}, ; 292
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 966; uint32_t java_name_index
	}, ; 293
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000015, ; uint32_t type_token_id
		i32 506; uint32_t java_name_index
	}, ; 294
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 44; uint32_t java_name_index
	}, ; 295
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x02000021, ; uint32_t type_token_id
		i32 996; uint32_t java_name_index
	}, ; 296
	%struct.TypeMapJava {
		i32 36, ; uint32_t module_index
		i32 u0x02000016, ; uint32_t type_token_id
		i32 1134; uint32_t java_name_index
	}, ; 297
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x02000003, ; uint32_t type_token_id
		i32 682; uint32_t java_name_index
	}, ; 298
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 624; uint32_t java_name_index
	}, ; 299
	%struct.TypeMapJava {
		i32 24, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1016; uint32_t java_name_index
	}, ; 300
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200017c, ; uint32_t type_token_id
		i32 110; uint32_t java_name_index
	}, ; 301
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 437; uint32_t java_name_index
	}, ; 302
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000380, ; uint32_t type_token_id
		i32 857; uint32_t java_name_index
	}, ; 303
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000143, ; uint32_t type_token_id
		i32 80; uint32_t java_name_index
	}, ; 304
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000358, ; uint32_t type_token_id
		i32 839; uint32_t java_name_index
	}, ; 305
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 483; uint32_t java_name_index
	}, ; 306
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200040e, ; uint32_t type_token_id
		i32 462; uint32_t java_name_index
	}, ; 307
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a0, ; uint32_t type_token_id
		i32 566; uint32_t java_name_index
	}, ; 308
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003e3, ; uint32_t type_token_id
		i32 930; uint32_t java_name_index
	}, ; 309
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000640, ; uint32_t type_token_id
		i32 922; uint32_t java_name_index
	}, ; 310
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000042, ; uint32_t type_token_id
		i32 937; uint32_t java_name_index
	}, ; 311
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200029c, ; uint32_t type_token_id
		i32 257; uint32_t java_name_index
	}, ; 312
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 213; uint32_t java_name_index
	}, ; 313
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x020000a2, ; uint32_t type_token_id
		i32 656; uint32_t java_name_index
	}, ; 314
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200061c, ; uint32_t type_token_id
		i32 863; uint32_t java_name_index
	}, ; 315
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 481; uint32_t java_name_index
	}, ; 316
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 558; uint32_t java_name_index
	}, ; 317
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000190, ; uint32_t type_token_id
		i32 124; uint32_t java_name_index
	}, ; 318
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1028; uint32_t java_name_index
	}, ; 319
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001c4, ; uint32_t type_token_id
		i32 161; uint32_t java_name_index
	}, ; 320
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200037e, ; uint32_t type_token_id
		i32 378; uint32_t java_name_index
	}, ; 321
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000310, ; uint32_t type_token_id
		i32 311; uint32_t java_name_index
	}, ; 322
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200037c, ; uint32_t type_token_id
		i32 851; uint32_t java_name_index
	}, ; 323
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1123; uint32_t java_name_index
	}, ; 324
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000620, ; uint32_t type_token_id
		i32 866; uint32_t java_name_index
	}, ; 325
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x02000060, ; uint32_t type_token_id
		i32 1003; uint32_t java_name_index
	}, ; 326
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 2; uint32_t java_name_index
	}, ; 327
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000099, ; uint32_t type_token_id
		i32 647; uint32_t java_name_index
	}, ; 328
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000e2, ; uint32_t type_token_id
		i32 702; uint32_t java_name_index
	}, ; 329
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 547; uint32_t java_name_index
	}, ; 330
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000052, ; uint32_t type_token_id
		i32 606; uint32_t java_name_index
	}, ; 331
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 978; uint32_t java_name_index
	}, ; 332
	%struct.TypeMapJava {
		i32 22, ; uint32_t module_index
		i32 u0x02000027, ; uint32_t type_token_id
		i32 1004; uint32_t java_name_index
	}, ; 333
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 194; uint32_t java_name_index
	}, ; 334
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003a8, ; uint32_t type_token_id
		i32 400; uint32_t java_name_index
	}, ; 335
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 684; uint32_t java_name_index
	}, ; 336
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 83; uint32_t java_name_index
	}, ; 337
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200012a, ; uint32_t type_token_id
		i32 63; uint32_t java_name_index
	}, ; 338
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1122; uint32_t java_name_index
	}, ; 339
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001c6, ; uint32_t type_token_id
		i32 726; uint32_t java_name_index
	}, ; 340
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000bf, ; uint32_t type_token_id
		i32 583; uint32_t java_name_index
	}, ; 341
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200041d, ; uint32_t type_token_id
		i32 476; uint32_t java_name_index
	}, ; 342
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000084, ; uint32_t type_token_id
		i32 1072; uint32_t java_name_index
	}, ; 343
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 620; uint32_t java_name_index
	}, ; 344
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 703; uint32_t java_name_index
	}, ; 345
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020002d2, ; uint32_t type_token_id
		i32 768; uint32_t java_name_index
	}, ; 346
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 976; uint32_t java_name_index
	}, ; 347
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 68; uint32_t java_name_index
	}, ; 348
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000cc, ; uint32_t type_token_id
		i32 13; uint32_t java_name_index
	}, ; 349
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200007e, ; uint32_t type_token_id
		i32 1068; uint32_t java_name_index
	}, ; 350
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200037f, ; uint32_t type_token_id
		i32 856; uint32_t java_name_index
	}, ; 351
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002bc, ; uint32_t type_token_id
		i32 262; uint32_t java_name_index
	}, ; 352
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ab, ; uint32_t type_token_id
		i32 574; uint32_t java_name_index
	}, ; 353
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000042, ; uint32_t type_token_id
		i32 593; uint32_t java_name_index
	}, ; 354
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f6, ; uint32_t type_token_id
		i32 287; uint32_t java_name_index
	}, ; 355
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020002eb, ; uint32_t type_token_id
		i32 769; uint32_t java_name_index
	}, ; 356
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 796; uint32_t java_name_index
	}, ; 357
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000006, ; uint32_t type_token_id
		i32 587; uint32_t java_name_index
	}, ; 358
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 982; uint32_t java_name_index
	}, ; 359
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200063f, ; uint32_t type_token_id
		i32 921; uint32_t java_name_index
	}, ; 360
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000024, ; uint32_t type_token_id
		i32 1080; uint32_t java_name_index
	}, ; 361
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200003a, ; uint32_t type_token_id
		i32 934; uint32_t java_name_index
	}, ; 362
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200041e, ; uint32_t type_token_id
		i32 477; uint32_t java_name_index
	}, ; 363
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000305, ; uint32_t type_token_id
		i32 301; uint32_t java_name_index
	}, ; 364
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1070; uint32_t java_name_index
	}, ; 365
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 8; uint32_t java_name_index
	}, ; 366
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000041, ; uint32_t type_token_id
		i32 592; uint32_t java_name_index
	}, ; 367
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a6, ; uint32_t type_token_id
		i32 141; uint32_t java_name_index
	}, ; 368
	%struct.TypeMapJava {
		i32 27, ; uint32_t module_index
		i32 u0x02000002, ; uint32_t type_token_id
		i32 1036; uint32_t java_name_index
	}, ; 369
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000339, ; uint32_t type_token_id
		i32 340; uint32_t java_name_index
	}, ; 370
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000062, ; uint32_t type_token_id
		i32 615; uint32_t java_name_index
	}, ; 371
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1055; uint32_t java_name_index
	}, ; 372
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000369, ; uint32_t type_token_id
		i32 844; uint32_t java_name_index
	}, ; 373
	%struct.TypeMapJava {
		i32 24, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1017; uint32_t java_name_index
	}, ; 374
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000367, ; uint32_t type_token_id
		i32 366; uint32_t java_name_index
	}, ; 375
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 1061; uint32_t java_name_index
	}, ; 376
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000439, ; uint32_t type_token_id
		i32 494; uint32_t java_name_index
	}, ; 377
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200039f, ; uint32_t type_token_id
		i32 393; uint32_t java_name_index
	}, ; 378
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000309, ; uint32_t type_token_id
		i32 305; uint32_t java_name_index
	}, ; 379
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 215; uint32_t java_name_index
	}, ; 380
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 889; uint32_t java_name_index
	}, ; 381
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 983; uint32_t java_name_index
	}, ; 382
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 172; uint32_t java_name_index
	}, ; 383
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 449; uint32_t java_name_index
	}, ; 384
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x02000046, ; uint32_t type_token_id
		i32 999; uint32_t java_name_index
	}, ; 385
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200013f, ; uint32_t type_token_id
		i32 77; uint32_t java_name_index
	}, ; 386
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200035b, ; uint32_t type_token_id
		i32 840; uint32_t java_name_index
	}, ; 387
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 562; uint32_t java_name_index
	}, ; 388
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000342, ; uint32_t type_token_id
		i32 344; uint32_t java_name_index
	}, ; 389
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000178, ; uint32_t type_token_id
		i32 108; uint32_t java_name_index
	}, ; 390
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000142, ; uint32_t type_token_id
		i32 79; uint32_t java_name_index
	}, ; 391
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200038a, ; uint32_t type_token_id
		i32 869; uint32_t java_name_index
	}, ; 392
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000023, ; uint32_t type_token_id
		i32 677; uint32_t java_name_index
	}, ; 393
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200005d, ; uint32_t type_token_id
		i32 612; uint32_t java_name_index
	}, ; 394
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200028f, ; uint32_t type_token_id
		i32 249; uint32_t java_name_index
	}, ; 395
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 707; uint32_t java_name_index
	}, ; 396
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002be, ; uint32_t type_token_id
		i32 263; uint32_t java_name_index
	}, ; 397
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000bc, ; uint32_t type_token_id
		i32 4; uint32_t java_name_index
	}, ; 398
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 322; uint32_t java_name_index
	}, ; 399
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 179; uint32_t java_name_index
	}, ; 400
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003c7, ; uint32_t type_token_id
		i32 420; uint32_t java_name_index
	}, ; 401
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 454; uint32_t java_name_index
	}, ; 402
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 981; uint32_t java_name_index
	}, ; 403
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000635, ; uint32_t type_token_id
		i32 900; uint32_t java_name_index
	}, ; 404
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 961; uint32_t java_name_index
	}, ; 405
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000062, ; uint32_t type_token_id
		i32 822; uint32_t java_name_index
	}, ; 406
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000090, ; uint32_t type_token_id
		i32 643; uint32_t java_name_index
	}, ; 407
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200011b, ; uint32_t type_token_id
		i32 55; uint32_t java_name_index
	}, ; 408
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x020000a8, ; uint32_t type_token_id
		i32 660; uint32_t java_name_index
	}, ; 409
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001fa, ; uint32_t type_token_id
		i32 760; uint32_t java_name_index
	}, ; 410
	%struct.TypeMapJava {
		i32 35, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1129; uint32_t java_name_index
	}, ; 411
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 407; uint32_t java_name_index
	}, ; 412
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003c9, ; uint32_t type_token_id
		i32 421; uint32_t java_name_index
	}, ; 413
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000085, ; uint32_t type_token_id
		i32 633; uint32_t java_name_index
	}, ; 414
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001d3, ; uint32_t type_token_id
		i32 167; uint32_t java_name_index
	}, ; 415
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200032f, ; uint32_t type_token_id
		i32 332; uint32_t java_name_index
	}, ; 416
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001dc, ; uint32_t type_token_id
		i32 744; uint32_t java_name_index
	}, ; 417
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f3, ; uint32_t type_token_id
		i32 284; uint32_t java_name_index
	}, ; 418
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 695; uint32_t java_name_index
	}, ; 419
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 436; uint32_t java_name_index
	}, ; 420
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000358, ; uint32_t type_token_id
		i32 774; uint32_t java_name_index
	}, ; 421
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000106, ; uint32_t type_token_id
		i32 46; uint32_t java_name_index
	}, ; 422
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000379, ; uint32_t type_token_id
		i32 374; uint32_t java_name_index
	}, ; 423
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200003e, ; uint32_t type_token_id
		i32 936; uint32_t java_name_index
	}, ; 424
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 986; uint32_t java_name_index
	}, ; 425
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200021e, ; uint32_t type_token_id
		i32 201; uint32_t java_name_index
	}, ; 426
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a5, ; uint32_t type_token_id
		i32 140; uint32_t java_name_index
	}, ; 427
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000020, ; uint32_t type_token_id
		i32 675; uint32_t java_name_index
	}, ; 428
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000049, ; uint32_t type_token_id
		i32 944; uint32_t java_name_index
	}, ; 429
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000606, ; uint32_t type_token_id
		i32 841; uint32_t java_name_index
	}, ; 430
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200009e, ; uint32_t type_token_id
		i32 652; uint32_t java_name_index
	}, ; 431
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1113; uint32_t java_name_index
	}, ; 432
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000aa, ; uint32_t type_token_id
		i32 573; uint32_t java_name_index
	}, ; 433
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000d9, ; uint32_t type_token_id
		i32 22; uint32_t java_name_index
	}, ; 434
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 706; uint32_t java_name_index
	}, ; 435
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 151; uint32_t java_name_index
	}, ; 436
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 406; uint32_t java_name_index
	}, ; 437
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f5, ; uint32_t type_token_id
		i32 286; uint32_t java_name_index
	}, ; 438
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000613, ; uint32_t type_token_id
		i32 850; uint32_t java_name_index
	}, ; 439
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001d4, ; uint32_t type_token_id
		i32 168; uint32_t java_name_index
	}, ; 440
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000417, ; uint32_t type_token_id
		i32 471; uint32_t java_name_index
	}, ; 441
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000430, ; uint32_t type_token_id
		i32 487; uint32_t java_name_index
	}, ; 442
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 186; uint32_t java_name_index
	}, ; 443
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003c3, ; uint32_t type_token_id
		i32 905; uint32_t java_name_index
	}, ; 444
	%struct.TypeMapJava {
		i32 26, ; uint32_t module_index
		i32 u0x02000005, ; uint32_t type_token_id
		i32 1033; uint32_t java_name_index
	}, ; 445
	%struct.TypeMapJava {
		i32 26, ; uint32_t module_index
		i32 u0x02000002, ; uint32_t type_token_id
		i32 1030; uint32_t java_name_index
	}, ; 446
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200040b, ; uint32_t type_token_id
		i32 459; uint32_t java_name_index
	}, ; 447
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d5, ; uint32_t type_token_id
		i32 740; uint32_t java_name_index
	}, ; 448
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001dc, ; uint32_t type_token_id
		i32 173; uint32_t java_name_index
	}, ; 449
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200011c, ; uint32_t type_token_id
		i32 56; uint32_t java_name_index
	}, ; 450
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000193, ; uint32_t type_token_id
		i32 719; uint32_t java_name_index
	}, ; 451
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000127, ; uint32_t type_token_id
		i32 60; uint32_t java_name_index
	}, ; 452
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000016, ; uint32_t type_token_id
		i32 668; uint32_t java_name_index
	}, ; 453
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200011e, ; uint32_t type_token_id
		i32 57; uint32_t java_name_index
	}, ; 454
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000047, ; uint32_t type_token_id
		i32 804; uint32_t java_name_index
	}, ; 455
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200021b, ; uint32_t type_token_id
		i32 199; uint32_t java_name_index
	}, ; 456
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 661; uint32_t java_name_index
	}, ; 457
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000022, ; uint32_t type_token_id
		i32 515; uint32_t java_name_index
	}, ; 458
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200040c, ; uint32_t type_token_id
		i32 460; uint32_t java_name_index
	}, ; 459
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x02000020, ; uint32_t type_token_id
		i32 1111; uint32_t java_name_index
	}, ; 460
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 246; uint32_t java_name_index
	}, ; 461
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1125; uint32_t java_name_index
	}, ; 462
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000256, ; uint32_t type_token_id
		i32 224; uint32_t java_name_index
	}, ; 463
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000337, ; uint32_t type_token_id
		i32 338; uint32_t java_name_index
	}, ; 464
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 439; uint32_t java_name_index
	}, ; 465
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x0200000f, ; uint32_t type_token_id
		i32 693; uint32_t java_name_index
	}, ; 466
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200012c, ; uint32_t type_token_id
		i32 64; uint32_t java_name_index
	}, ; 467
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 152; uint32_t java_name_index
	}, ; 468
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 377; uint32_t java_name_index
	}, ; 469
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 578; uint32_t java_name_index
	}, ; 470
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003f0, ; uint32_t type_token_id
		i32 444; uint32_t java_name_index
	}, ; 471
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 616; uint32_t java_name_index
	}, ; 472
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000171, ; uint32_t type_token_id
		i32 104; uint32_t java_name_index
	}, ; 473
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200032a, ; uint32_t type_token_id
		i32 330; uint32_t java_name_index
	}, ; 474
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e6, ; uint32_t type_token_id
		i32 750; uint32_t java_name_index
	}, ; 475
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a8, ; uint32_t type_token_id
		i32 143; uint32_t java_name_index
	}, ; 476
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000336, ; uint32_t type_token_id
		i32 337; uint32_t java_name_index
	}, ; 477
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 887; uint32_t java_name_index
	}, ; 478
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1021; uint32_t java_name_index
	}, ; 479
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000302, ; uint32_t type_token_id
		i32 298; uint32_t java_name_index
	}, ; 480
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200056f, ; uint32_t type_token_id
		i32 824; uint32_t java_name_index
	}, ; 481
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200035f, ; uint32_t type_token_id
		i32 360; uint32_t java_name_index
	}, ; 482
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 441; uint32_t java_name_index
	}, ; 483
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 626; uint32_t java_name_index
	}, ; 484
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000048, ; uint32_t type_token_id
		i32 805; uint32_t java_name_index
	}, ; 485
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 101; uint32_t java_name_index
	}, ; 486
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 537; uint32_t java_name_index
	}, ; 487
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 174; uint32_t java_name_index
	}, ; 488
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1110; uint32_t java_name_index
	}, ; 489
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 951; uint32_t java_name_index
	}, ; 490
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000098, ; uint32_t type_token_id
		i32 985; uint32_t java_name_index
	}, ; 491
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003de, ; uint32_t type_token_id
		i32 924; uint32_t java_name_index
	}, ; 492
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000324, ; uint32_t type_token_id
		i32 326; uint32_t java_name_index
	}, ; 493
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000010, ; uint32_t type_token_id
		i32 662; uint32_t java_name_index
	}, ; 494
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200033a, ; uint32_t type_token_id
		i32 771; uint32_t java_name_index
	}, ; 495
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d2, ; uint32_t type_token_id
		i32 737; uint32_t java_name_index
	}, ; 496
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ad, ; uint32_t type_token_id
		i32 575; uint32_t java_name_index
	}, ; 497
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 488; uint32_t java_name_index
	}, ; 498
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 543; uint32_t java_name_index
	}, ; 499
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000070, ; uint32_t type_token_id
		i32 963; uint32_t java_name_index
	}, ; 500
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000157, ; uint32_t type_token_id
		i32 93; uint32_t java_name_index
	}, ; 501
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200013e, ; uint32_t type_token_id
		i32 76; uint32_t java_name_index
	}, ; 502
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000061, ; uint32_t type_token_id
		i32 1053; uint32_t java_name_index
	}, ; 503
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200026a, ; uint32_t type_token_id
		i32 231; uint32_t java_name_index
	}, ; 504
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000263, ; uint32_t type_token_id
		i32 229; uint32_t java_name_index
	}, ; 505
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 1148; uint32_t java_name_index
	}, ; 506
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000312, ; uint32_t type_token_id
		i32 313; uint32_t java_name_index
	}, ; 507
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003d1, ; uint32_t type_token_id
		i32 911; uint32_t java_name_index
	}, ; 508
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a7, ; uint32_t type_token_id
		i32 142; uint32_t java_name_index
	}, ; 509
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 350; uint32_t java_name_index
	}, ; 510
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1121; uint32_t java_name_index
	}, ; 511
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000038, ; uint32_t type_token_id
		i32 933; uint32_t java_name_index
	}, ; 512
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000315, ; uint32_t type_token_id
		i32 315; uint32_t java_name_index
	}, ; 513
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000023, ; uint32_t type_token_id
		i32 1079; uint32_t java_name_index
	}, ; 514
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000186, ; uint32_t type_token_id
		i32 118; uint32_t java_name_index
	}, ; 515
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 690; uint32_t java_name_index
	}, ; 516
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 535; uint32_t java_name_index
	}, ; 517
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001cb, ; uint32_t type_token_id
		i32 730; uint32_t java_name_index
	}, ; 518
	%struct.TypeMapJava {
		i32 23, ; uint32_t module_index
		i32 u0x02000005, ; uint32_t type_token_id
		i32 1008; uint32_t java_name_index
	}, ; 519
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200018f, ; uint32_t type_token_id
		i32 716; uint32_t java_name_index
	}, ; 520
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 45; uint32_t java_name_index
	}, ; 521
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003d5, ; uint32_t type_token_id
		i32 430; uint32_t java_name_index
	}, ; 522
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000349, ; uint32_t type_token_id
		i32 348; uint32_t java_name_index
	}, ; 523
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000334, ; uint32_t type_token_id
		i32 336; uint32_t java_name_index
	}, ; 524
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x0200002d, ; uint32_t type_token_id
		i32 1087; uint32_t java_name_index
	}, ; 525
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000011, ; uint32_t type_token_id
		i32 663; uint32_t java_name_index
	}, ; 526
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b4, ; uint32_t type_token_id
		i32 579; uint32_t java_name_index
	}, ; 527
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200020d, ; uint32_t type_token_id
		i32 762; uint32_t java_name_index
	}, ; 528
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020005f3, ; uint32_t type_token_id
		i32 828; uint32_t java_name_index
	}, ; 529
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200006d, ; uint32_t type_token_id
		i32 960; uint32_t java_name_index
	}, ; 530
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000384, ; uint32_t type_token_id
		i32 861; uint32_t java_name_index
	}, ; 531
	%struct.TypeMapJava {
		i32 35, ; uint32_t module_index
		i32 u0x02000011, ; uint32_t type_token_id
		i32 1130; uint32_t java_name_index
	}, ; 532
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000042, ; uint32_t type_token_id
		i32 520; uint32_t java_name_index
	}, ; 533
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000069, ; uint32_t type_token_id
		i32 542; uint32_t java_name_index
	}, ; 534
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000378, ; uint32_t type_token_id
		i32 373; uint32_t java_name_index
	}, ; 535
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200040a, ; uint32_t type_token_id
		i32 458; uint32_t java_name_index
	}, ; 536
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d3, ; uint32_t type_token_id
		i32 738; uint32_t java_name_index
	}, ; 537
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 42; uint32_t java_name_index
	}, ; 538
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200031c, ; uint32_t type_token_id
		i32 320; uint32_t java_name_index
	}, ; 539
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000332, ; uint32_t type_token_id
		i32 335; uint32_t java_name_index
	}, ; 540
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 530; uint32_t java_name_index
	}, ; 541
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 632; uint32_t java_name_index
	}, ; 542
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000047, ; uint32_t type_token_id
		i32 942; uint32_t java_name_index
	}, ; 543
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200029d, ; uint32_t type_token_id
		i32 258; uint32_t java_name_index
	}, ; 544
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200012d, ; uint32_t type_token_id
		i32 65; uint32_t java_name_index
	}, ; 545
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200021c, ; uint32_t type_token_id
		i32 200; uint32_t java_name_index
	}, ; 546
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000fc, ; uint32_t type_token_id
		i32 41; uint32_t java_name_index
	}, ; 547
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 353; uint32_t java_name_index
	}, ; 548
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200014a, ; uint32_t type_token_id
		i32 85; uint32_t java_name_index
	}, ; 549
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000181, ; uint32_t type_token_id
		i32 115; uint32_t java_name_index
	}, ; 550
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 153; uint32_t java_name_index
	}, ; 551
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x020000a0, ; uint32_t type_token_id
		i32 654; uint32_t java_name_index
	}, ; 552
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 533; uint32_t java_name_index
	}, ; 553
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003ef, ; uint32_t type_token_id
		i32 443; uint32_t java_name_index
	}, ; 554
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000e6, ; uint32_t type_token_id
		i32 28; uint32_t java_name_index
	}, ; 555
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 452; uint32_t java_name_index
	}, ; 556
	%struct.TypeMapJava {
		i32 20, ; uint32_t module_index
		i32 u0x02000028, ; uint32_t type_token_id
		i32 993; uint32_t java_name_index
	}, ; 557
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 1069; uint32_t java_name_index
	}, ; 558
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000f0, ; uint32_t type_token_id
		i32 35; uint32_t java_name_index
	}, ; 559
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000283, ; uint32_t type_token_id
		i32 245; uint32_t java_name_index
	}, ; 560
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 75; uint32_t java_name_index
	}, ; 561
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000b8, ; uint32_t type_token_id
		i32 581; uint32_t java_name_index
	}, ; 562
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200035f, ; uint32_t type_token_id
		i32 776; uint32_t java_name_index
	}, ; 563
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200037a, ; uint32_t type_token_id
		i32 375; uint32_t java_name_index
	}, ; 564
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000018, ; uint32_t type_token_id
		i32 670; uint32_t java_name_index
	}, ; 565
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000355, ; uint32_t type_token_id
		i32 355; uint32_t java_name_index
	}, ; 566
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003b7, ; uint32_t type_token_id
		i32 411; uint32_t java_name_index
	}, ; 567
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000335, ; uint32_t type_token_id
		i32 770; uint32_t java_name_index
	}, ; 568
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001ae, ; uint32_t type_token_id
		i32 148; uint32_t java_name_index
	}, ; 569
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1088; uint32_t java_name_index
	}, ; 570
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000116, ; uint32_t type_token_id
		i32 54; uint32_t java_name_index
	}, ; 571
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002fd, ; uint32_t type_token_id
		i32 293; uint32_t java_name_index
	}, ; 572
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000d2, ; uint32_t type_token_id
		i32 18; uint32_t java_name_index
	}, ; 573
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 953; uint32_t java_name_index
	}, ; 574
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000360, ; uint32_t type_token_id
		i32 361; uint32_t java_name_index
	}, ; 575
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1119; uint32_t java_name_index
	}, ; 576
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1124; uint32_t java_name_index
	}, ; 577
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000330, ; uint32_t type_token_id
		i32 333; uint32_t java_name_index
	}, ; 578
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x02000014, ; uint32_t type_token_id
		i32 781; uint32_t java_name_index
	}, ; 579
	%struct.TypeMapJava {
		i32 24, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1018; uint32_t java_name_index
	}, ; 580
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001cf, ; uint32_t type_token_id
		i32 165; uint32_t java_name_index
	}, ; 581
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200034a, ; uint32_t type_token_id
		i32 830; uint32_t java_name_index
	}, ; 582
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x02000055, ; uint32_t type_token_id
		i32 1001; uint32_t java_name_index
	}, ; 583
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000017, ; uint32_t type_token_id
		i32 669; uint32_t java_name_index
	}, ; 584
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a9, ; uint32_t type_token_id
		i32 572; uint32_t java_name_index
	}, ; 585
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000060, ; uint32_t type_token_id
		i32 820; uint32_t java_name_index
	}, ; 586
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003d5, ; uint32_t type_token_id
		i32 914; uint32_t java_name_index
	}, ; 587
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200028e, ; uint32_t type_token_id
		i32 248; uint32_t java_name_index
	}, ; 588
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000087, ; uint32_t type_token_id
		i32 555; uint32_t java_name_index
	}, ; 589
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1106; uint32_t java_name_index
	}, ; 590
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000050, ; uint32_t type_token_id
		i32 809; uint32_t java_name_index
	}, ; 591
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000015, ; uint32_t type_token_id
		i32 667; uint32_t java_name_index
	}, ; 592
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 557; uint32_t java_name_index
	}, ; 593
	%struct.TypeMapJava {
		i32 23, ; uint32_t module_index
		i32 u0x02000004, ; uint32_t type_token_id
		i32 1007; uint32_t java_name_index
	}, ; 594
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000122, ; uint32_t type_token_id
		i32 59; uint32_t java_name_index
	}, ; 595
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f8, ; uint32_t type_token_id
		i32 289; uint32_t java_name_index
	}, ; 596
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 405; uint32_t java_name_index
	}, ; 597
	%struct.TypeMapJava {
		i32 23, ; uint32_t module_index
		i32 u0x02000006, ; uint32_t type_token_id
		i32 1009; uint32_t java_name_index
	}, ; 598
	%struct.TypeMapJava {
		i32 22, ; uint32_t module_index
		i32 u0x02000028, ; uint32_t type_token_id
		i32 1005; uint32_t java_name_index
	}, ; 599
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 0; uint32_t java_name_index
	}, ; 600
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000351, ; uint32_t type_token_id
		i32 352; uint32_t java_name_index
	}, ; 601
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003c5, ; uint32_t type_token_id
		i32 906; uint32_t java_name_index
	}, ; 602
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 814; uint32_t java_name_index
	}, ; 603
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 958; uint32_t java_name_index
	}, ; 604
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1093; uint32_t java_name_index
	}, ; 605
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 601; uint32_t java_name_index
	}, ; 606
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 614; uint32_t java_name_index
	}, ; 607
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 948; uint32_t java_name_index
	}, ; 608
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 672; uint32_t java_name_index
	}, ; 609
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000229, ; uint32_t type_token_id
		i32 766; uint32_t java_name_index
	}, ; 610
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e9, ; uint32_t type_token_id
		i32 752; uint32_t java_name_index
	}, ; 611
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000074, ; uint32_t type_token_id
		i32 1064; uint32_t java_name_index
	}, ; 612
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003a9, ; uint32_t type_token_id
		i32 401; uint32_t java_name_index
	}, ; 613
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003a4, ; uint32_t type_token_id
		i32 397; uint32_t java_name_index
	}, ; 614
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 628; uint32_t java_name_index
	}, ; 615
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000046, ; uint32_t type_token_id
		i32 941; uint32_t java_name_index
	}, ; 616
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200037b, ; uint32_t type_token_id
		i32 376; uint32_t java_name_index
	}, ; 617
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200018a, ; uint32_t type_token_id
		i32 711; uint32_t java_name_index
	}, ; 618
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000050, ; uint32_t type_token_id
		i32 532; uint32_t java_name_index
	}, ; 619
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200029b, ; uint32_t type_token_id
		i32 256; uint32_t java_name_index
	}, ; 620
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1090; uint32_t java_name_index
	}, ; 621
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000354, ; uint32_t type_token_id
		i32 354; uint32_t java_name_index
	}, ; 622
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x02000040, ; uint32_t type_token_id
		i32 1144; uint32_t java_name_index
	}, ; 623
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1022; uint32_t java_name_index
	}, ; 624
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 817; uint32_t java_name_index
	}, ; 625
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000300, ; uint32_t type_token_id
		i32 296; uint32_t java_name_index
	}, ; 626
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c4, ; uint32_t type_token_id
		i32 586; uint32_t java_name_index
	}, ; 627
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 688; uint32_t java_name_index
	}, ; 628
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x02000029, ; uint32_t type_token_id
		i32 1117; uint32_t java_name_index
	}, ; 629
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000354, ; uint32_t type_token_id
		i32 837; uint32_t java_name_index
	}, ; 630
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x02000027, ; uint32_t type_token_id
		i32 1115; uint32_t java_name_index
	}, ; 631
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 484; uint32_t java_name_index
	}, ; 632
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 508; uint32_t java_name_index
	}, ; 633
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001a5, ; uint32_t type_token_id
		i32 721; uint32_t java_name_index
	}, ; 634
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000280, ; uint32_t type_token_id
		i32 243; uint32_t java_name_index
	}, ; 635
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000058, ; uint32_t type_token_id
		i32 1047; uint32_t java_name_index
	}, ; 636
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200007c, ; uint32_t type_token_id
		i32 1067; uint32_t java_name_index
	}, ; 637
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000352, ; uint32_t type_token_id
		i32 836; uint32_t java_name_index
	}, ; 638
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000421, ; uint32_t type_token_id
		i32 479; uint32_t java_name_index
	}, ; 639
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000145, ; uint32_t type_token_id
		i32 81; uint32_t java_name_index
	}, ; 640
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000149, ; uint32_t type_token_id
		i32 84; uint32_t java_name_index
	}, ; 641
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000632, ; uint32_t type_token_id
		i32 886; uint32_t java_name_index
	}, ; 642
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000279, ; uint32_t type_token_id
		i32 238; uint32_t java_name_index
	}, ; 643
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 182; uint32_t java_name_index
	}, ; 644
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x02000018, ; uint32_t type_token_id
		i32 678; uint32_t java_name_index
	}, ; 645
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000059, ; uint32_t type_token_id
		i32 1048; uint32_t java_name_index
	}, ; 646
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000394, ; uint32_t type_token_id
		i32 386; uint32_t java_name_index
	}, ; 647
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200030c, ; uint32_t type_token_id
		i32 308; uint32_t java_name_index
	}, ; 648
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000154, ; uint32_t type_token_id
		i32 92; uint32_t java_name_index
	}, ; 649
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200043b, ; uint32_t type_token_id
		i32 496; uint32_t java_name_index
	}, ; 650
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000363, ; uint32_t type_token_id
		i32 363; uint32_t java_name_index
	}, ; 651
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000111, ; uint32_t type_token_id
		i32 52; uint32_t java_name_index
	}, ; 652
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000228, ; uint32_t type_token_id
		i32 765; uint32_t java_name_index
	}, ; 653
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 816; uint32_t java_name_index
	}, ; 654
	%struct.TypeMapJava {
		i32 8, ; uint32_t module_index
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 687; uint32_t java_name_index
	}, ; 655
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000624, ; uint32_t type_token_id
		i32 870; uint32_t java_name_index
	}, ; 656
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 645; uint32_t java_name_index
	}, ; 657
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003a7, ; uint32_t type_token_id
		i32 399; uint32_t java_name_index
	}, ; 658
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000301, ; uint32_t type_token_id
		i32 297; uint32_t java_name_index
	}, ; 659
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1052; uint32_t java_name_index
	}, ; 660
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003d6, ; uint32_t type_token_id
		i32 915; uint32_t java_name_index
	}, ; 661
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000070, ; uint32_t type_token_id
		i32 546; uint32_t java_name_index
	}, ; 662
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003d8, ; uint32_t type_token_id
		i32 432; uint32_t java_name_index
	}, ; 663
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 218; uint32_t java_name_index
	}, ; 664
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000ae, ; uint32_t type_token_id
		i32 576; uint32_t java_name_index
	}, ; 665
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1040; uint32_t java_name_index
	}, ; 666
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1025; uint32_t java_name_index
	}, ; 667
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000b5, ; uint32_t type_token_id
		i32 1; uint32_t java_name_index
	}, ; 668
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000211, ; uint32_t type_token_id
		i32 764; uint32_t java_name_index
	}, ; 669
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 20; uint32_t java_name_index
	}, ; 670
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ac, ; uint32_t type_token_id
		i32 723; uint32_t java_name_index
	}, ; 671
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020006b7, ; uint32_t type_token_id
		i32 843; uint32_t java_name_index
	}, ; 672
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200061f, ; uint32_t type_token_id
		i32 865; uint32_t java_name_index
	}, ; 673
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000381, ; uint32_t type_token_id
		i32 858; uint32_t java_name_index
	}, ; 674
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200008d, ; uint32_t type_token_id
		i32 640; uint32_t java_name_index
	}, ; 675
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 1094; uint32_t java_name_index
	}, ; 676
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000ec, ; uint32_t type_token_id
		i32 32; uint32_t java_name_index
	}, ; 677
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200017b, ; uint32_t type_token_id
		i32 109; uint32_t java_name_index
	}, ; 678
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000385, ; uint32_t type_token_id
		i32 862; uint32_t java_name_index
	}, ; 679
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c1, ; uint32_t type_token_id
		i32 584; uint32_t java_name_index
	}, ; 680
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 357; uint32_t java_name_index
	}, ; 681
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 206; uint32_t java_name_index
	}, ; 682
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200007d, ; uint32_t type_token_id
		i32 627; uint32_t java_name_index
	}, ; 683
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000188, ; uint32_t type_token_id
		i32 710; uint32_t java_name_index
	}, ; 684
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 623; uint32_t java_name_index
	}, ; 685
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 1143; uint32_t java_name_index
	}, ; 686
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 1066; uint32_t java_name_index
	}, ; 687
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 559; uint32_t java_name_index
	}, ; 688
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003cb, ; uint32_t type_token_id
		i32 423; uint32_t java_name_index
	}, ; 689
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001c7, ; uint32_t type_token_id
		i32 727; uint32_t java_name_index
	}, ; 690
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000321, ; uint32_t type_token_id
		i32 323; uint32_t java_name_index
	}, ; 691
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 379; uint32_t java_name_index
	}, ; 692
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000045, ; uint32_t type_token_id
		i32 940; uint32_t java_name_index
	}, ; 693
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 220; uint32_t java_name_index
	}, ; 694
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000f0, ; uint32_t type_token_id
		i32 704; uint32_t java_name_index
	}, ; 695
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000139, ; uint32_t type_token_id
		i32 73; uint32_t java_name_index
	}, ; 696
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000180, ; uint32_t type_token_id
		i32 705; uint32_t java_name_index
	}, ; 697
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 787; uint32_t java_name_index
	}, ; 698
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001c3, ; uint32_t type_token_id
		i32 160; uint32_t java_name_index
	}, ; 699
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000399, ; uint32_t type_token_id
		i32 390; uint32_t java_name_index
	}, ; 700
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 349; uint32_t java_name_index
	}, ; 701
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000020, ; uint32_t type_token_id
		i32 513; uint32_t java_name_index
	}, ; 702
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 47; uint32_t java_name_index
	}, ; 703
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 797; uint32_t java_name_index
	}, ; 704
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000266, ; uint32_t type_token_id
		i32 230; uint32_t java_name_index
	}, ; 705
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000014, ; uint32_t type_token_id
		i32 666; uint32_t java_name_index
	}, ; 706
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ce, ; uint32_t type_token_id
		i32 733; uint32_t java_name_index
	}, ; 707
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x02000044, ; uint32_t type_token_id
		i32 1145; uint32_t java_name_index
	}, ; 708
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 343; uint32_t java_name_index
	}, ; 709
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000366, ; uint32_t type_token_id
		i32 365; uint32_t java_name_index
	}, ; 710
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000085, ; uint32_t type_token_id
		i32 974; uint32_t java_name_index
	}, ; 711
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003ad, ; uint32_t type_token_id
		i32 404; uint32_t java_name_index
	}, ; 712
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200007f, ; uint32_t type_token_id
		i32 552; uint32_t java_name_index
	}, ; 713
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000374, ; uint32_t type_token_id
		i32 372; uint32_t java_name_index
	}, ; 714
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000053, ; uint32_t type_token_id
		i32 607; uint32_t java_name_index
	}, ; 715
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 603; uint32_t java_name_index
	}, ; 716
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000047, ; uint32_t type_token_id
		i32 597; uint32_t java_name_index
	}, ; 717
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200005b, ; uint32_t type_token_id
		i32 1050; uint32_t java_name_index
	}, ; 718
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200009d, ; uint32_t type_token_id
		i32 651; uint32_t java_name_index
	}, ; 719
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003d1, ; uint32_t type_token_id
		i32 427; uint32_t java_name_index
	}, ; 720
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000137, ; uint32_t type_token_id
		i32 71; uint32_t java_name_index
	}, ; 721
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000416, ; uint32_t type_token_id
		i32 470; uint32_t java_name_index
	}, ; 722
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 7; uint32_t java_name_index
	}, ; 723
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000051, ; uint32_t type_token_id
		i32 810; uint32_t java_name_index
	}, ; 724
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1109; uint32_t java_name_index
	}, ; 725
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001c8, ; uint32_t type_token_id
		i32 728; uint32_t java_name_index
	}, ; 726
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000ef, ; uint32_t type_token_id
		i32 34; uint32_t java_name_index
	}, ; 727
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200024e, ; uint32_t type_token_id
		i32 223; uint32_t java_name_index
	}, ; 728
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000272, ; uint32_t type_token_id
		i32 236; uint32_t java_name_index
	}, ; 729
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 67; uint32_t java_name_index
	}, ; 730
	%struct.TypeMapJava {
		i32 33, ; uint32_t module_index
		i32 u0x02000009, ; uint32_t type_token_id
		i32 1102; uint32_t java_name_index
	}, ; 731
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200020b, ; uint32_t type_token_id
		i32 190; uint32_t java_name_index
	}, ; 732
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200008f, ; uint32_t type_token_id
		i32 642; uint32_t java_name_index
	}, ; 733
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200010c, ; uint32_t type_token_id
		i32 49; uint32_t java_name_index
	}, ; 734
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000359, ; uint32_t type_token_id
		i32 775; uint32_t java_name_index
	}, ; 735
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 794; uint32_t java_name_index
	}, ; 736
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 180; uint32_t java_name_index
	}, ; 737
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003be, ; uint32_t type_token_id
		i32 901; uint32_t java_name_index
	}, ; 738
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 24; uint32_t java_name_index
	}, ; 739
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x02000014, ; uint32_t type_token_id
		i32 696; uint32_t java_name_index
	}, ; 740
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200006a, ; uint32_t type_token_id
		i32 957; uint32_t java_name_index
	}, ; 741
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000325, ; uint32_t type_token_id
		i32 327; uint32_t java_name_index
	}, ; 742
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020002d1, ; uint32_t type_token_id
		i32 767; uint32_t java_name_index
	}, ; 743
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000311, ; uint32_t type_token_id
		i32 312; uint32_t java_name_index
	}, ; 744
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001d7, ; uint32_t type_token_id
		i32 171; uint32_t java_name_index
	}, ; 745
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 608; uint32_t java_name_index
	}, ; 746
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200004f, ; uint32_t type_token_id
		i32 531; uint32_t java_name_index
	}, ; 747
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000017, ; uint32_t type_token_id
		i32 507; uint32_t java_name_index
	}, ; 748
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003e2, ; uint32_t type_token_id
		i32 929; uint32_t java_name_index
	}, ; 749
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 100; uint32_t java_name_index
	}, ; 750
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000411, ; uint32_t type_token_id
		i32 465; uint32_t java_name_index
	}, ; 751
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000316, ; uint32_t type_token_id
		i32 316; uint32_t java_name_index
	}, ; 752
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 955; uint32_t java_name_index
	}, ; 753
	%struct.TypeMapJava {
		i32 14, ; uint32_t module_index
		i32 u0x0200001a, ; uint32_t type_token_id
		i32 791; uint32_t java_name_index
	}, ; 754
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a0, ; uint32_t type_token_id
		i32 135; uint32_t java_name_index
	}, ; 755
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d7, ; uint32_t type_token_id
		i32 741; uint32_t java_name_index
	}, ; 756
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a1, ; uint32_t type_token_id
		i32 136; uint32_t java_name_index
	}, ; 757
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000053, ; uint32_t type_token_id
		i32 812; uint32_t java_name_index
	}, ; 758
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a9, ; uint32_t type_token_id
		i32 144; uint32_t java_name_index
	}, ; 759
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000611, ; uint32_t type_token_id
		i32 849; uint32_t java_name_index
	}, ; 760
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001c9, ; uint32_t type_token_id
		i32 729; uint32_t java_name_index
	}, ; 761
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000043, ; uint32_t type_token_id
		i32 938; uint32_t java_name_index
	}, ; 762
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000220, ; uint32_t type_token_id
		i32 202; uint32_t java_name_index
	}, ; 763
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003b4, ; uint32_t type_token_id
		i32 890; uint32_t java_name_index
	}, ; 764
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 448; uint32_t java_name_index
	}, ; 765
	%struct.TypeMapJava {
		i32 10, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 697; uint32_t java_name_index
	}, ; 766
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000041, ; uint32_t type_token_id
		i32 519; uint32_t java_name_index
	}, ; 767
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001eb, ; uint32_t type_token_id
		i32 181; uint32_t java_name_index
	}, ; 768
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 442; uint32_t java_name_index
	}, ; 769
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200027e, ; uint32_t type_token_id
		i32 241; uint32_t java_name_index
	}, ; 770
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200037a, ; uint32_t type_token_id
		i32 847; uint32_t java_name_index
	}, ; 771
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 613; uint32_t java_name_index
	}, ; 772
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200009a, ; uint32_t type_token_id
		i32 1078; uint32_t java_name_index
	}, ; 773
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000212, ; uint32_t type_token_id
		i32 195; uint32_t java_name_index
	}, ; 774
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200036b, ; uint32_t type_token_id
		i32 367; uint32_t java_name_index
	}, ; 775
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200043a, ; uint32_t type_token_id
		i32 495; uint32_t java_name_index
	}, ; 776
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 217; uint32_t java_name_index
	}, ; 777
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 120; uint32_t java_name_index
	}, ; 778
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000065, ; uint32_t type_token_id
		i32 1056; uint32_t java_name_index
	}, ; 779
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 345; uint32_t java_name_index
	}, ; 780
	%struct.TypeMapJava {
		i32 26, ; uint32_t module_index
		i32 u0x02000003, ; uint32_t type_token_id
		i32 1031; uint32_t java_name_index
	}, ; 781
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002ec, ; uint32_t type_token_id
		i32 277; uint32_t java_name_index
	}, ; 782
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000239, ; uint32_t type_token_id
		i32 212; uint32_t java_name_index
	}, ; 783
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 87; uint32_t java_name_index
	}, ; 784
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000050, ; uint32_t type_token_id
		i32 1098; uint32_t java_name_index
	}, ; 785
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000054, ; uint32_t type_token_id
		i32 1044; uint32_t java_name_index
	}, ; 786
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000410, ; uint32_t type_token_id
		i32 464; uint32_t java_name_index
	}, ; 787
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003af, ; uint32_t type_token_id
		i32 885; uint32_t java_name_index
	}, ; 788
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000140, ; uint32_t type_token_id
		i32 78; uint32_t java_name_index
	}, ; 789
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 219; uint32_t java_name_index
	}, ; 790
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000071, ; uint32_t type_token_id
		i32 964; uint32_t java_name_index
	}, ; 791
	%struct.TypeMapJava {
		i32 20, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 990; uint32_t java_name_index
	}, ; 792
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000289, ; uint32_t type_token_id
		i32 247; uint32_t java_name_index
	}, ; 793
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200039b, ; uint32_t type_token_id
		i32 391; uint32_t java_name_index
	}, ; 794
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 261; uint32_t java_name_index
	}, ; 795
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200044e, ; uint32_t type_token_id
		i32 499; uint32_t java_name_index
	}, ; 796
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000197, ; uint32_t type_token_id
		i32 130; uint32_t java_name_index
	}, ; 797
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003b5, ; uint32_t type_token_id
		i32 891; uint32_t java_name_index
	}, ; 798
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 638; uint32_t java_name_index
	}, ; 799
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200006d, ; uint32_t type_token_id
		i32 618; uint32_t java_name_index
	}, ; 800
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003b8, ; uint32_t type_token_id
		i32 894; uint32_t java_name_index
	}, ; 801
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000bc, ; uint32_t type_token_id
		i32 698; uint32_t java_name_index
	}, ; 802
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003c2, ; uint32_t type_token_id
		i32 904; uint32_t java_name_index
	}, ; 803
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000085, ; uint32_t type_token_id
		i32 1073; uint32_t java_name_index
	}, ; 804
	%struct.TypeMapJava {
		i32 32, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1100; uint32_t java_name_index
	}, ; 805
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000072, ; uint32_t type_token_id
		i32 965; uint32_t java_name_index
	}, ; 806
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003d2, ; uint32_t type_token_id
		i32 912; uint32_t java_name_index
	}, ; 807
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1103; uint32_t java_name_index
	}, ; 808
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000644, ; uint32_t type_token_id
		i32 926; uint32_t java_name_index
	}, ; 809
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000338, ; uint32_t type_token_id
		i32 826; uint32_t java_name_index
	}, ; 810
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000174, ; uint32_t type_token_id
		i32 106; uint32_t java_name_index
	}, ; 811
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000187, ; uint32_t type_token_id
		i32 709; uint32_t java_name_index
	}, ; 812
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200039e, ; uint32_t type_token_id
		i32 882; uint32_t java_name_index
	}, ; 813
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x02000034, ; uint32_t type_token_id
		i32 1141; uint32_t java_name_index
	}, ; 814
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000292, ; uint32_t type_token_id
		i32 251; uint32_t java_name_index
	}, ; 815
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 521; uint32_t java_name_index
	}, ; 816
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000089, ; uint32_t type_token_id
		i32 637; uint32_t java_name_index
	}, ; 817
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 455; uint32_t java_name_index
	}, ; 818
	%struct.TypeMapJava {
		i32 5, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 679; uint32_t java_name_index
	}, ; 819
	%struct.TypeMapJava {
		i32 22, ; uint32_t module_index
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 1006; uint32_t java_name_index
	}, ; 820
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200037b, ; uint32_t type_token_id
		i32 848; uint32_t java_name_index
	}, ; 821
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003db, ; uint32_t type_token_id
		i32 918; uint32_t java_name_index
	}, ; 822
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000150, ; uint32_t type_token_id
		i32 88; uint32_t java_name_index
	}, ; 823
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000067, ; uint32_t type_token_id
		i32 541; uint32_t java_name_index
	}, ; 824
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000081, ; uint32_t type_token_id
		i32 971; uint32_t java_name_index
	}, ; 825
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a3, ; uint32_t type_token_id
		i32 138; uint32_t java_name_index
	}, ; 826
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000e9, ; uint32_t type_token_id
		i32 30; uint32_t java_name_index
	}, ; 827
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000386, ; uint32_t type_token_id
		i32 864; uint32_t java_name_index
	}, ; 828
	%struct.TypeMapJava {
		i32 35, ; uint32_t module_index
		i32 u0x0200000c, ; uint32_t type_token_id
		i32 1127; uint32_t java_name_index
	}, ; 829
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 873; uint32_t java_name_index
	}, ; 830
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001d5, ; uint32_t type_token_id
		i32 169; uint32_t java_name_index
	}, ; 831
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200009f, ; uint32_t type_token_id
		i32 653; uint32_t java_name_index
	}, ; 832
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000351, ; uint32_t type_token_id
		i32 835; uint32_t java_name_index
	}, ; 833
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f7, ; uint32_t type_token_id
		i32 759; uint32_t java_name_index
	}, ; 834
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d0, ; uint32_t type_token_id
		i32 735; uint32_t java_name_index
	}, ; 835
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200025e, ; uint32_t type_token_id
		i32 226; uint32_t java_name_index
	}, ; 836
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003a3, ; uint32_t type_token_id
		i32 884; uint32_t java_name_index
	}, ; 837
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200039d, ; uint32_t type_token_id
		i32 881; uint32_t java_name_index
	}, ; 838
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 162; uint32_t java_name_index
	}, ; 839
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 956; uint32_t java_name_index
	}, ; 840
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000097, ; uint32_t type_token_id
		i32 984; uint32_t java_name_index
	}, ; 841
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 980; uint32_t java_name_index
	}, ; 842
	%struct.TypeMapJava {
		i32 19, ; uint32_t module_index
		i32 u0x0200000e, ; uint32_t type_token_id
		i32 987; uint32_t java_name_index
	}, ; 843
	%struct.TypeMapJava {
		i32 33, ; uint32_t module_index
		i32 u0x02000008, ; uint32_t type_token_id
		i32 1101; uint32_t java_name_index
	}, ; 844
	%struct.TypeMapJava {
		i32 36, ; uint32_t module_index
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 1136; uint32_t java_name_index
	}, ; 845
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000371, ; uint32_t type_token_id
		i32 369; uint32_t java_name_index
	}, ; 846
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 150; uint32_t java_name_index
	}, ; 847
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002fe, ; uint32_t type_token_id
		i32 294; uint32_t java_name_index
	}, ; 848
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000296, ; uint32_t type_token_id
		i32 254; uint32_t java_name_index
	}, ; 849
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200018d, ; uint32_t type_token_id
		i32 714; uint32_t java_name_index
	}, ; 850
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 946; uint32_t java_name_index
	}, ; 851
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 196; uint32_t java_name_index
	}, ; 852
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003b6, ; uint32_t type_token_id
		i32 892; uint32_t java_name_index
	}, ; 853
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x0200001e, ; uint32_t type_token_id
		i32 674; uint32_t java_name_index
	}, ; 854
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f4, ; uint32_t type_token_id
		i32 285; uint32_t java_name_index
	}, ; 855
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 935; uint32_t java_name_index
	}, ; 856
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000184, ; uint32_t type_token_id
		i32 117; uint32_t java_name_index
	}, ; 857
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000047, ; uint32_t type_token_id
		i32 524; uint32_t java_name_index
	}, ; 858
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000338, ; uint32_t type_token_id
		i32 339; uint32_t java_name_index
	}, ; 859
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000146, ; uint32_t type_token_id
		i32 82; uint32_t java_name_index
	}, ; 860
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200024d, ; uint32_t type_token_id
		i32 222; uint32_t java_name_index
	}, ; 861
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001bb, ; uint32_t type_token_id
		i32 155; uint32_t java_name_index
	}, ; 862
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000032, ; uint32_t type_token_id
		i32 793; uint32_t java_name_index
	}, ; 863
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 221; uint32_t java_name_index
	}, ; 864
	%struct.TypeMapJava {
		i32 26, ; uint32_t module_index
		i32 u0x02000006, ; uint32_t type_token_id
		i32 1034; uint32_t java_name_index
	}, ; 865
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 995; uint32_t java_name_index
	}, ; 866
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000021, ; uint32_t type_token_id
		i32 676; uint32_t java_name_index
	}, ; 867
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000051, ; uint32_t type_token_id
		i32 1042; uint32_t java_name_index
	}, ; 868
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1120; uint32_t java_name_index
	}, ; 869
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 1060; uint32_t java_name_index
	}, ; 870
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000382, ; uint32_t type_token_id
		i32 859; uint32_t java_name_index
	}, ; 871
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200034d, ; uint32_t type_token_id
		i32 773; uint32_t java_name_index
	}, ; 872
	%struct.TypeMapJava {
		i32 24, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1014; uint32_t java_name_index
	}, ; 873
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000d1, ; uint32_t type_token_id
		i32 17; uint32_t java_name_index
	}, ; 874
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200007b, ; uint32_t type_token_id
		i32 550; uint32_t java_name_index
	}, ; 875
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002ee, ; uint32_t type_token_id
		i32 279; uint32_t java_name_index
	}, ; 876
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001ef, ; uint32_t type_token_id
		i32 183; uint32_t java_name_index
	}, ; 877
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 211; uint32_t java_name_index
	}, ; 878
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 440; uint32_t java_name_index
	}, ; 879
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000011, ; uint32_t type_token_id
		i32 503; uint32_t java_name_index
	}, ; 880
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003ba, ; uint32_t type_token_id
		i32 896; uint32_t java_name_index
	}, ; 881
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000277, ; uint32_t type_token_id
		i32 237; uint32_t java_name_index
	}, ; 882
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200030d, ; uint32_t type_token_id
		i32 309; uint32_t java_name_index
	}, ; 883
	%struct.TypeMapJava {
		i32 24, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1013; uint32_t java_name_index
	}, ; 884
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000081, ; uint32_t type_token_id
		i32 630; uint32_t java_name_index
	}, ; 885
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 9; uint32_t java_name_index
	}, ; 886
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 132; uint32_t java_name_index
	}, ; 887
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200009c, ; uint32_t type_token_id
		i32 650; uint32_t java_name_index
	}, ; 888
	%struct.TypeMapJava {
		i32 4, ; uint32_t module_index
		i32 u0x02000012, ; uint32_t type_token_id
		i32 664; uint32_t java_name_index
	}, ; 889
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x0200005e, ; uint32_t type_token_id
		i32 818; uint32_t java_name_index
	}, ; 890
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 553; uint32_t java_name_index
	}, ; 891
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003a3, ; uint32_t type_token_id
		i32 396; uint32_t java_name_index
	}, ; 892
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1062; uint32_t java_name_index
	}, ; 893
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001cd, ; uint32_t type_token_id
		i32 732; uint32_t java_name_index
	}, ; 894
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 591; uint32_t java_name_index
	}, ; 895
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 1096; uint32_t java_name_index
	}, ; 896
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000055, ; uint32_t type_token_id
		i32 1045; uint32_t java_name_index
	}, ; 897
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020006ae, ; uint32_t type_token_id
		i32 927; uint32_t java_name_index
	}, ; 898
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000087, ; uint32_t type_token_id
		i32 635; uint32_t java_name_index
	}, ; 899
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f2, ; uint32_t type_token_id
		i32 283; uint32_t java_name_index
	}, ; 900
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f1, ; uint32_t type_token_id
		i32 282; uint32_t java_name_index
	}, ; 901
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 877; uint32_t java_name_index
	}, ; 902
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200032b, ; uint32_t type_token_id
		i32 331; uint32_t java_name_index
	}, ; 903
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020000e1, ; uint32_t type_token_id
		i32 701; uint32_t java_name_index
	}, ; 904
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000046, ; uint32_t type_token_id
		i32 596; uint32_t java_name_index
	}, ; 905
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 590; uint32_t java_name_index
	}, ; 906
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 95; uint32_t java_name_index
	}, ; 907
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004a, ; uint32_t type_token_id
		i32 600; uint32_t java_name_index
	}, ; 908
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 177; uint32_t java_name_index
	}, ; 909
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000261, ; uint32_t type_token_id
		i32 228; uint32_t java_name_index
	}, ; 910
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000e8, ; uint32_t type_token_id
		i32 29; uint32_t java_name_index
	}, ; 911
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000bf, ; uint32_t type_token_id
		i32 6; uint32_t java_name_index
	}, ; 912
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x02000010, ; uint32_t type_token_id
		i32 694; uint32_t java_name_index
	}, ; 913
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 184; uint32_t java_name_index
	}, ; 914
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d1, ; uint32_t type_token_id
		i32 736; uint32_t java_name_index
	}, ; 915
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000091, ; uint32_t type_token_id
		i32 560; uint32_t java_name_index
	}, ; 916
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000436, ; uint32_t type_token_id
		i32 492; uint32_t java_name_index
	}, ; 917
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 358; uint32_t java_name_index
	}, ; 918
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000076, ; uint32_t type_token_id
		i32 967; uint32_t java_name_index
	}, ; 919
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200029e, ; uint32_t type_token_id
		i32 259; uint32_t java_name_index
	}, ; 920
	%struct.TypeMapJava {
		i32 35, ; uint32_t module_index
		i32 u0x0200000d, ; uint32_t type_token_id
		i32 1128; uint32_t java_name_index
	}, ; 921
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 875; uint32_t java_name_index
	}, ; 922
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000087, ; uint32_t type_token_id
		i32 975; uint32_t java_name_index
	}, ; 923
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f9, ; uint32_t type_token_id
		i32 290; uint32_t java_name_index
	}, ; 924
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003bc, ; uint32_t type_token_id
		i32 898; uint32_t java_name_index
	}, ; 925
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003bb, ; uint32_t type_token_id
		i32 897; uint32_t java_name_index
	}, ; 926
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001f3, ; uint32_t type_token_id
		i32 185; uint32_t java_name_index
	}, ; 927
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200009f, ; uint32_t type_token_id
		i32 565; uint32_t java_name_index
	}, ; 928
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 800; uint32_t java_name_index
	}, ; 929
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000052, ; uint32_t type_token_id
		i32 811; uint32_t java_name_index
	}, ; 930
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 447; uint32_t java_name_index
	}, ; 931
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003ab, ; uint32_t type_token_id
		i32 403; uint32_t java_name_index
	}, ; 932
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000082, ; uint32_t type_token_id
		i32 631; uint32_t java_name_index
	}, ; 933
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200001b, ; uint32_t type_token_id
		i32 509; uint32_t java_name_index
	}, ; 934
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000614, ; uint32_t type_token_id
		i32 853; uint32_t java_name_index
	}, ; 935
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 121; uint32_t java_name_index
	}, ; 936
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002f7, ; uint32_t type_token_id
		i32 288; uint32_t java_name_index
	}, ; 937
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000099, ; uint32_t type_token_id
		i32 561; uint32_t java_name_index
	}, ; 938
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 102; uint32_t java_name_index
	}, ; 939
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003b7, ; uint32_t type_token_id
		i32 893; uint32_t java_name_index
	}, ; 940
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000407, ; uint32_t type_token_id
		i32 456; uint32_t java_name_index
	}, ; 941
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000151, ; uint32_t type_token_id
		i32 89; uint32_t java_name_index
	}, ; 942
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 625; uint32_t java_name_index
	}, ; 943
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200008e, ; uint32_t type_token_id
		i32 979; uint32_t java_name_index
	}, ; 944
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 580; uint32_t java_name_index
	}, ; 945
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ec, ; uint32_t type_token_id
		i32 754; uint32_t java_name_index
	}, ; 946
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002ca, ; uint32_t type_token_id
		i32 266; uint32_t java_name_index
	}, ; 947
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000383, ; uint32_t type_token_id
		i32 860; uint32_t java_name_index
	}, ; 948
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000f8, ; uint32_t type_token_id
		i32 39; uint32_t java_name_index
	}, ; 949
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000395, ; uint32_t type_token_id
		i32 874; uint32_t java_name_index
	}, ; 950
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000087, ; uint32_t type_token_id
		i32 1074; uint32_t java_name_index
	}, ; 951
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001ad, ; uint32_t type_token_id
		i32 147; uint32_t java_name_index
	}, ; 952
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003b6, ; uint32_t type_token_id
		i32 410; uint32_t java_name_index
	}, ; 953
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1024; uint32_t java_name_index
	}, ; 954
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000007, ; uint32_t type_token_id
		i32 588; uint32_t java_name_index
	}, ; 955
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000079, ; uint32_t type_token_id
		i32 969; uint32_t java_name_index
	}, ; 956
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 451; uint32_t java_name_index
	}, ; 957
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 970; uint32_t java_name_index
	}, ; 958
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000317, ; uint32_t type_token_id
		i32 317; uint32_t java_name_index
	}, ; 959
	%struct.TypeMapJava {
		i32 24, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1015; uint32_t java_name_index
	}, ; 960
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020006af, ; uint32_t type_token_id
		i32 928; uint32_t java_name_index
	}, ; 961
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020003ce, ; uint32_t type_token_id
		i32 908; uint32_t java_name_index
	}, ; 962
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200020a, ; uint32_t type_token_id
		i32 189; uint32_t java_name_index
	}, ; 963
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000419, ; uint32_t type_token_id
		i32 473; uint32_t java_name_index
	}, ; 964
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200005a, ; uint32_t type_token_id
		i32 1049; uint32_t java_name_index
	}, ; 965
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 1039; uint32_t java_name_index
	}, ; 966
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003a1, ; uint32_t type_token_id
		i32 394; uint32_t java_name_index
	}, ; 967
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200029a, ; uint32_t type_token_id
		i32 255; uint32_t java_name_index
	}, ; 968
	%struct.TypeMapJava {
		i32 7, ; uint32_t module_index
		i32 u0x02000079, ; uint32_t type_token_id
		i32 686; uint32_t java_name_index
	}, ; 969
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000010, ; uint32_t type_token_id
		i32 502; uint32_t java_name_index
	}, ; 970
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002c9, ; uint32_t type_token_id
		i32 265; uint32_t java_name_index
	}, ; 971
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000217, ; uint32_t type_token_id
		i32 197; uint32_t java_name_index
	}, ; 972
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x02000009, ; uint32_t type_token_id
		i32 689; uint32_t java_name_index
	}, ; 973
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000029, ; uint32_t type_token_id
		i32 518; uint32_t java_name_index
	}, ; 974
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000176, ; uint32_t type_token_id
		i32 107; uint32_t java_name_index
	}, ; 975
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002fb, ; uint32_t type_token_id
		i32 292; uint32_t java_name_index
	}, ; 976
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200040f, ; uint32_t type_token_id
		i32 463; uint32_t java_name_index
	}, ; 977
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1105; uint32_t java_name_index
	}, ; 978
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200018d, ; uint32_t type_token_id
		i32 122; uint32_t java_name_index
	}, ; 979
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001aa, ; uint32_t type_token_id
		i32 145; uint32_t java_name_index
	}, ; 980
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 99; uint32_t java_name_index
	}, ; 981
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000bd, ; uint32_t type_token_id
		i32 5; uint32_t java_name_index
	}, ; 982
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200019e, ; uint32_t type_token_id
		i32 134; uint32_t java_name_index
	}, ; 983
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000387, ; uint32_t type_token_id
		i32 867; uint32_t java_name_index
	}, ; 984
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003a2, ; uint32_t type_token_id
		i32 395; uint32_t java_name_index
	}, ; 985
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000e3, ; uint32_t type_token_id
		i32 26; uint32_t java_name_index
	}, ; 986
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200021a, ; uint32_t type_token_id
		i32 198; uint32_t java_name_index
	}, ; 987
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000193, ; uint32_t type_token_id
		i32 127; uint32_t java_name_index
	}, ; 988
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002e3, ; uint32_t type_token_id
		i32 271; uint32_t java_name_index
	}, ; 989
	%struct.TypeMapJava {
		i32 36, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1135; uint32_t java_name_index
	}, ; 990
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000014, ; uint32_t type_token_id
		i32 505; uint32_t java_name_index
	}, ; 991
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200020f, ; uint32_t type_token_id
		i32 193; uint32_t java_name_index
	}, ; 992
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x02000021, ; uint32_t type_token_id
		i32 514; uint32_t java_name_index
	}, ; 993
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000091, ; uint32_t type_token_id
		i32 644; uint32_t java_name_index
	}, ; 994
	%struct.TypeMapJava {
		i32 15, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 792; uint32_t java_name_index
	}, ; 995
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 413; uint32_t java_name_index
	}, ; 996
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 807; uint32_t java_name_index
	}, ; 997
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000364, ; uint32_t type_token_id
		i32 364; uint32_t java_name_index
	}, ; 998
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002e1, ; uint32_t type_token_id
		i32 270; uint32_t java_name_index
	}, ; 999
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200031a, ; uint32_t type_token_id
		i32 319; uint32_t java_name_index
	}, ; 1000
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200037e, ; uint32_t type_token_id
		i32 855; uint32_t java_name_index
	}, ; 1001
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200010d, ; uint32_t type_token_id
		i32 50; uint32_t java_name_index
	}, ; 1002
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000073, ; uint32_t type_token_id
		i32 548; uint32_t java_name_index
	}, ; 1003
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002ff, ; uint32_t type_token_id
		i32 295; uint32_t java_name_index
	}, ; 1004
	%struct.TypeMapJava {
		i32 2, ; uint32_t module_index
		i32 u0x02000008, ; uint32_t type_token_id
		i32 589; uint32_t java_name_index
	}, ; 1005
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200008a, ; uint32_t type_token_id
		i32 977; uint32_t java_name_index
	}, ; 1006
	%struct.TypeMapJava {
		i32 35, ; uint32_t module_index
		i32 u0x02000017, ; uint32_t type_token_id
		i32 1133; uint32_t java_name_index
	}, ; 1007
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000198, ; uint32_t type_token_id
		i32 720; uint32_t java_name_index
	}, ; 1008
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000290, ; uint32_t type_token_id
		i32 250; uint32_t java_name_index
	}, ; 1009
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200006b, ; uint32_t type_token_id
		i32 544; uint32_t java_name_index
	}, ; 1010
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002ef, ; uint32_t type_token_id
		i32 280; uint32_t java_name_index
	}, ; 1011
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200000b, ; uint32_t type_token_id
		i32 500; uint32_t java_name_index
	}, ; 1012
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 998; uint32_t java_name_index
	}, ; 1013
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200040d, ; uint32_t type_token_id
		i32 461; uint32_t java_name_index
	}, ; 1014
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000ee, ; uint32_t type_token_id
		i32 33; uint32_t java_name_index
	}, ; 1015
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000159, ; uint32_t type_token_id
		i32 94; uint32_t java_name_index
	}, ; 1016
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000c3, ; uint32_t type_token_id
		i32 585; uint32_t java_name_index
	}, ; 1017
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 604; uint32_t java_name_index
	}, ; 1018
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000138, ; uint32_t type_token_id
		i32 72; uint32_t java_name_index
	}, ; 1019
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200030e, ; uint32_t type_token_id
		i32 310; uint32_t java_name_index
	}, ; 1020
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003cf, ; uint32_t type_token_id
		i32 426; uint32_t java_name_index
	}, ; 1021
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 98; uint32_t java_name_index
	}, ; 1022
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 23; uint32_t java_name_index
	}, ; 1023
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 878; uint32_t java_name_index
	}, ; 1024
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003b5, ; uint32_t type_token_id
		i32 409; uint32_t java_name_index
	}, ; 1025
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1126; uint32_t java_name_index
	}, ; 1026
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 207; uint32_t java_name_index
	}, ; 1027
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x0200004e, ; uint32_t type_token_id
		i32 808; uint32_t java_name_index
	}, ; 1028
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000066, ; uint32_t type_token_id
		i32 540; uint32_t java_name_index
	}, ; 1029
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000026, ; uint32_t type_token_id
		i32 1082; uint32_t java_name_index
	}, ; 1030
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200019c, ; uint32_t type_token_id
		i32 133; uint32_t java_name_index
	}, ; 1031
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x0200002a, ; uint32_t type_token_id
		i32 1118; uint32_t java_name_index
	}, ; 1032
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x0200003c, ; uint32_t type_token_id
		i32 1029; uint32_t java_name_index
	}, ; 1033
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 383; uint32_t java_name_index
	}, ; 1034
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000346, ; uint32_t type_token_id
		i32 346; uint32_t java_name_index
	}, ; 1035
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000308, ; uint32_t type_token_id
		i32 304; uint32_t java_name_index
	}, ; 1036
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x02000044, ; uint32_t type_token_id
		i32 939; uint32_t java_name_index
	}, ; 1037
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200030a, ; uint32_t type_token_id
		i32 306; uint32_t java_name_index
	}, ; 1038
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000373, ; uint32_t type_token_id
		i32 371; uint32_t java_name_index
	}, ; 1039
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200034b, ; uint32_t type_token_id
		i32 831; uint32_t java_name_index
	}, ; 1040
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001f4, ; uint32_t type_token_id
		i32 757; uint32_t java_name_index
	}, ; 1041
	%struct.TypeMapJava {
		i32 28, ; uint32_t module_index
		i32 u0x02000012, ; uint32_t type_token_id
		i32 1037; uint32_t java_name_index
	}, ; 1042
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200005c, ; uint32_t type_token_id
		i32 611; uint32_t java_name_index
	}, ; 1043
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002b7, ; uint32_t type_token_id
		i32 260; uint32_t java_name_index
	}, ; 1044
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x0200005f, ; uint32_t type_token_id
		i32 1002; uint32_t java_name_index
	}, ; 1045
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002eb, ; uint32_t type_token_id
		i32 276; uint32_t java_name_index
	}, ; 1046
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000cd, ; uint32_t type_token_id
		i32 14; uint32_t java_name_index
	}, ; 1047
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001a2, ; uint32_t type_token_id
		i32 137; uint32_t java_name_index
	}, ; 1048
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200039b, ; uint32_t type_token_id
		i32 880; uint32_t java_name_index
	}, ; 1049
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200033e, ; uint32_t type_token_id
		i32 342; uint32_t java_name_index
	}, ; 1050
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002e7, ; uint32_t type_token_id
		i32 274; uint32_t java_name_index
	}, ; 1051
	%struct.TypeMapJava {
		i32 37, ; uint32_t module_index
		i32 u0x0200002c, ; uint32_t type_token_id
		i32 1139; uint32_t java_name_index
	}, ; 1052
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x02000031, ; uint32_t type_token_id
		i32 1023; uint32_t java_name_index
	}, ; 1053
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 529; uint32_t java_name_index
	}, ; 1054
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x0200020f, ; uint32_t type_token_id
		i32 763; uint32_t java_name_index
	}, ; 1055
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000423, ; uint32_t type_token_id
		i32 480; uint32_t java_name_index
	}, ; 1056
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000314, ; uint32_t type_token_id
		i32 314; uint32_t java_name_index
	}, ; 1057
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000328, ; uint32_t type_token_id
		i32 328; uint32_t java_name_index
	}, ; 1058
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000080, ; uint32_t type_token_id
		i32 629; uint32_t java_name_index
	}, ; 1059
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 69; uint32_t java_name_index
	}, ; 1060
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000383, ; uint32_t type_token_id
		i32 381; uint32_t java_name_index
	}, ; 1061
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 252; uint32_t java_name_index
	}, ; 1062
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001cf, ; uint32_t type_token_id
		i32 734; uint32_t java_name_index
	}, ; 1063
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 176; uint32_t java_name_index
	}, ; 1064
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000194, ; uint32_t type_token_id
		i32 128; uint32_t java_name_index
	}, ; 1065
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000323, ; uint32_t type_token_id
		i32 325; uint32_t java_name_index
	}, ; 1066
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 1038; uint32_t java_name_index
	}, ; 1067
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200049f, ; uint32_t type_token_id
		i32 823; uint32_t java_name_index
	}, ; 1068
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000331, ; uint32_t type_token_id
		i32 334; uint32_t java_name_index
	}, ; 1069
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000434, ; uint32_t type_token_id
		i32 490; uint32_t java_name_index
	}, ; 1070
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000224, ; uint32_t type_token_id
		i32 203; uint32_t java_name_index
	}, ; 1071
	%struct.TypeMapJava {
		i32 26, ; uint32_t module_index
		i32 u0x02000004, ; uint32_t type_token_id
		i32 1032; uint32_t java_name_index
	}, ; 1072
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200027d, ; uint32_t type_token_id
		i32 240; uint32_t java_name_index
	}, ; 1073
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000643, ; uint32_t type_token_id
		i32 925; uint32_t java_name_index
	}, ; 1074
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000152, ; uint32_t type_token_id
		i32 90; uint32_t java_name_index
	}, ; 1075
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x0200004b, ; uint32_t type_token_id
		i32 527; uint32_t java_name_index
	}, ; 1076
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x0200002b, ; uint32_t type_token_id
		i32 1086; uint32_t java_name_index
	}, ; 1077
	%struct.TypeMapJava {
		i32 25, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1026; uint32_t java_name_index
	}, ; 1078
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001f7, ; uint32_t type_token_id
		i32 187; uint32_t java_name_index
	}, ; 1079
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003d9, ; uint32_t type_token_id
		i32 433; uint32_t java_name_index
	}, ; 1080
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003bf, ; uint32_t type_token_id
		i32 416; uint32_t java_name_index
	}, ; 1081
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x020000a3, ; uint32_t type_token_id
		i32 657; uint32_t java_name_index
	}, ; 1082
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001d9, ; uint32_t type_token_id
		i32 742; uint32_t java_name_index
	}, ; 1083
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001df, ; uint32_t type_token_id
		i32 175; uint32_t java_name_index
	}, ; 1084
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200006e, ; uint32_t type_token_id
		i32 619; uint32_t java_name_index
	}, ; 1085
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003db, ; uint32_t type_token_id
		i32 434; uint32_t java_name_index
	}, ; 1086
	%struct.TypeMapJava {
		i32 20, ; uint32_t module_index
		i32 u0x0200001c, ; uint32_t type_token_id
		i32 988; uint32_t java_name_index
	}, ; 1087
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x020005f9, ; uint32_t type_token_id
		i32 829; uint32_t java_name_index
	}, ; 1088
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200017f, ; uint32_t type_token_id
		i32 113; uint32_t java_name_index
	}, ; 1089
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 779; uint32_t java_name_index
	}, ; 1090
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001df, ; uint32_t type_token_id
		i32 747; uint32_t java_name_index
	}, ; 1091
	%struct.TypeMapJava {
		i32 23, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1011; uint32_t java_name_index
	}, ; 1092
	%struct.TypeMapJava {
		i32 6, ; uint32_t module_index
		i32 u0x02000004, ; uint32_t type_token_id
		i32 683; uint32_t java_name_index
	}, ; 1093
	%struct.TypeMapJava {
		i32 20, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 992; uint32_t java_name_index
	}, ; 1094
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020001bc, ; uint32_t type_token_id
		i32 156; uint32_t java_name_index
	}, ; 1095
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 516; uint32_t java_name_index
	}, ; 1096
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000100, ; uint32_t type_token_id
		i32 43; uint32_t java_name_index
	}, ; 1097
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 910; uint32_t java_name_index
	}, ; 1098
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 563; uint32_t java_name_index
	}, ; 1099
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003b4, ; uint32_t type_token_id
		i32 408; uint32_t java_name_index
	}, ; 1100
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x02000058, ; uint32_t type_token_id
		i32 536; uint32_t java_name_index
	}, ; 1101
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000372, ; uint32_t type_token_id
		i32 370; uint32_t java_name_index
	}, ; 1102
	%struct.TypeMapJava {
		i32 12, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 782; uint32_t java_name_index
	}, ; 1103
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200004d, ; uint32_t type_token_id
		i32 947; uint32_t java_name_index
	}, ; 1104
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001ea, ; uint32_t type_token_id
		i32 753; uint32_t java_name_index
	}, ; 1105
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200004c, ; uint32_t type_token_id
		i32 602; uint32_t java_name_index
	}, ; 1106
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020000cf, ; uint32_t type_token_id
		i32 15; uint32_t java_name_index
	}, ; 1107
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003d2, ; uint32_t type_token_id
		i32 428; uint32_t java_name_index
	}, ; 1108
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200043c, ; uint32_t type_token_id
		i32 497; uint32_t java_name_index
	}, ; 1109
	%struct.TypeMapJava {
		i32 21, ; uint32_t module_index
		i32 u0x02000023, ; uint32_t type_token_id
		i32 997; uint32_t java_name_index
	}, ; 1110
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 103; uint32_t java_name_index
	}, ; 1111
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index
		i32 u0x0200001d, ; uint32_t type_token_id
		i32 511; uint32_t java_name_index
	}, ; 1112
	%struct.TypeMapJava {
		i32 18, ; uint32_t module_index
		i32 u0x0200006c, ; uint32_t type_token_id
		i32 959; uint32_t java_name_index
	}, ; 1113
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x02000378, ; uint32_t type_token_id
		i32 846; uint32_t java_name_index
	}, ; 1114
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 799; uint32_t java_name_index
	}, ; 1115
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000045, ; uint32_t type_token_id
		i32 595; uint32_t java_name_index
	}, ; 1116
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200030b, ; uint32_t type_token_id
		i32 307; uint32_t java_name_index
	}, ; 1117
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001b7, ; uint32_t type_token_id
		i32 724; uint32_t java_name_index
	}, ; 1118
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002e4, ; uint32_t type_token_id
		i32 272; uint32_t java_name_index
	}, ; 1119
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 567; uint32_t java_name_index
	}, ; 1120
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 568; uint32_t java_name_index
	}, ; 1121
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 227; uint32_t java_name_index
	}, ; 1122
	%struct.TypeMapJava {
		i32 29, ; uint32_t module_index
		i32 u0x02000062, ; uint32_t type_token_id
		i32 1054; uint32_t java_name_index
	}, ; 1123
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x0200018f, ; uint32_t type_token_id
		i32 123; uint32_t java_name_index
	}, ; 1124
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x02000095, ; uint32_t type_token_id
		i32 646; uint32_t java_name_index
	}, ; 1125
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020002cb, ; uint32_t type_token_id
		i32 267; uint32_t java_name_index
	}, ; 1126
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 192; uint32_t java_name_index
	}, ; 1127
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 154; uint32_t java_name_index
	}, ; 1128
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 210; uint32_t java_name_index
	}, ; 1129
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 208; uint32_t java_name_index
	}, ; 1130
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000180, ; uint32_t type_token_id
		i32 114; uint32_t java_name_index
	}, ; 1131
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x020001e4, ; uint32_t type_token_id
		i32 749; uint32_t java_name_index
	}, ; 1132
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 450; uint32_t java_name_index
	}, ; 1133
	%struct.TypeMapJava {
		i32 30, ; uint32_t module_index
		i32 u0x02000030, ; uint32_t type_token_id
		i32 1089; uint32_t java_name_index
	}, ; 1134
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1107; uint32_t java_name_index
	}, ; 1135
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x020003c3, ; uint32_t type_token_id
		i32 418; uint32_t java_name_index
	}, ; 1136
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x02000304, ; uint32_t type_token_id
		i32 300; uint32_t java_name_index
	}, ; 1137
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000043, ; uint32_t type_token_id
		i32 802; uint32_t java_name_index
	}, ; 1138
	%struct.TypeMapJava {
		i32 9, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 692; uint32_t java_name_index
	}, ; 1139
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x0200009b, ; uint32_t type_token_id
		i32 649; uint32_t java_name_index
	}, ; 1140
	%struct.TypeMapJava {
		i32 17, ; uint32_t module_index
		i32 u0x0200034c, ; uint32_t type_token_id
		i32 832; uint32_t java_name_index
	}, ; 1141
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 425; uint32_t java_name_index
	}, ; 1142
	%struct.TypeMapJava {
		i32 31, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 58; uint32_t java_name_index
	}, ; 1143
	%struct.TypeMapJava {
		i32 34, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 1114; uint32_t java_name_index
	}, ; 1144
	%struct.TypeMapJava {
		i32 11, ; uint32_t module_index
		i32 u0x02000186, ; uint32_t type_token_id
		i32 708; uint32_t java_name_index
	}, ; 1145
	%struct.TypeMapJava {
		i32 3, ; uint32_t module_index
		i32 u0x020000a1, ; uint32_t type_token_id
		i32 655; uint32_t java_name_index
	}, ; 1146
	%struct.TypeMapJava {
		i32 35, ; uint32_t module_index
		i32 u0x02000012, ; uint32_t type_token_id
		i32 1131; uint32_t java_name_index
	}, ; 1147
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index
		i32 u0x00000000, ; uint32_t type_token_id
		i32 569; uint32_t java_name_index
	}, ; 1148
	%struct.TypeMapJava {
		i32 16, ; uint32_t module_index
		i32 u0x02000045, ; uint32_t type_token_id
		i32 803; uint32_t java_name_index
	} ; 1149
], align 4

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [1150 x ptr] [
	ptr @.tmr.0, ; 0 ('org/xmlpull/v1/XmlPullParser')
	ptr @.tmr.1, ; 1 ('org/xmlpull/v1/XmlPullParserException')
	ptr @.tmr.2, ; 2 ('javax/security/cert/Certificate')
	ptr @.tmr.3, ; 3 ('javax/security/cert/X509Certificate')
	ptr @.tmr.4, ; 4 ('javax/security/auth/Subject')
	ptr @.tmr.5, ; 5 ('javax/net/SocketFactory')
	ptr @.tmr.6, ; 6 ('javax/net/ssl/HttpsURLConnection')
	ptr @.tmr.7, ; 7 ('javax/net/ssl/HostnameVerifier')
	ptr @.tmr.8, ; 8 ('javax/net/ssl/KeyManager')
	ptr @.tmr.9, ; 9 ('javax/net/ssl/SSLSession')
	ptr @.tmr.10, ; 10 ('javax/net/ssl/SSLSessionContext')
	ptr @.tmr.11, ; 11 ('javax/net/ssl/TrustManager')
	ptr @.tmr.12, ; 12 ('javax/net/ssl/KeyManagerFactory')
	ptr @.tmr.13, ; 13 ('javax/net/ssl/SSLContext')
	ptr @.tmr.14, ; 14 ('javax/net/ssl/SSLSocketFactory')
	ptr @.tmr.15, ; 15 ('javax/net/ssl/TrustManagerFactory')
	ptr @.tmr.16, ; 16 ('javax/crypto/BadPaddingException')
	ptr @.tmr.17, ; 17 ('android/window/BackEvent')
	ptr @.tmr.18, ; 18 ('android/window/InputTransferToken')
	ptr @.tmr.19, ; 19 ('android/window/OnBackInvokedCallback')
	ptr @.tmr.20, ; 20 ('android/window/OnBackInvokedDispatcher')
	ptr @.tmr.21, ; 21 ('android/window/TrustedPresentationThresholds')
	ptr @.tmr.22, ; 22 ('android/webkit/CookieManager')
	ptr @.tmr.23, ; 23 ('android/webkit/ValueCallback')
	ptr @.tmr.24, ; 24 ('android/webkit/WebResourceRequest')
	ptr @.tmr.25, ; 25 ('android/webkit/RenderProcessGoneDetail')
	ptr @.tmr.26, ; 26 ('android/webkit/WebChromeClient')
	ptr @.tmr.27, ; 27 ('android/webkit/WebChromeClient$CustomViewCallback')
	ptr @.tmr.28, ; 28 ('android/webkit/WebChromeClient$FileChooserParams')
	ptr @.tmr.29, ; 29 ('android/webkit/WebMessage')
	ptr @.tmr.30, ; 30 ('android/webkit/WebResourceError')
	ptr @.tmr.31, ; 31 ('android/webkit/WebResourceResponse')
	ptr @.tmr.32, ; 32 ('android/webkit/WebSettings')
	ptr @.tmr.33, ; 33 ('android/webkit/WebView')
	ptr @.tmr.34, ; 34 ('android/webkit/WebViewClient')
	ptr @.tmr.35, ; 35 ('android/database/CharArrayBuffer')
	ptr @.tmr.36, ; 36 ('android/database/ContentObserver')
	ptr @.tmr.37, ; 37 ('android/database/DataSetObserver')
	ptr @.tmr.38, ; 38 ('android/database/Cursor')
	ptr @.tmr.39, ; 39 ('android/widget/AbsListView')
	ptr @.tmr.40, ; 40 ('android/widget/AbsListView$OnScrollListener')
	ptr @.tmr.41, ; 41 ('android/widget/AdapterView')
	ptr @.tmr.42, ; 42 ('android/widget/AdapterView$OnItemClickListener')
	ptr @.tmr.43, ; 43 ('mono/android/widget/AdapterView_OnItemClickListenerImplementor')
	ptr @.tmr.44, ; 44 ('android/widget/AdapterView$OnItemLongClickListener')
	ptr @.tmr.45, ; 45 ('android/widget/AdapterView$OnItemSelectedListener')
	ptr @.tmr.46, ; 46 ('android/widget/AutoCompleteTextView')
	ptr @.tmr.47, ; 47 ('android/widget/BaseAdapter')
	ptr @.tmr.48, ; 48 ('android/widget/DatePicker')
	ptr @.tmr.49, ; 49 ('android/widget/TextView')
	ptr @.tmr.50, ; 50 ('android/widget/TextView$BufferType')
	ptr @.tmr.51, ; 51 ('android/widget/TextView$OnEditorActionListener')
	ptr @.tmr.52, ; 52 ('mono/android/widget/TextView_OnEditorActionListenerImplementor')
	ptr @.tmr.53, ; 53 ('android/widget/AbsoluteLayout')
	ptr @.tmr.54, ; 54 ('android/widget/AbsSeekBar')
	ptr @.tmr.55, ; 55 ('android/widget/Button')
	ptr @.tmr.56, ; 56 ('android/widget/CheckBox')
	ptr @.tmr.57, ; 57 ('android/widget/CompoundButton')
	ptr @.tmr.58, ; 58 ('android/widget/CompoundButton$OnCheckedChangeListener')
	ptr @.tmr.59, ; 59 ('mono/android/widget/CompoundButton_OnCheckedChangeListenerImplementor')
	ptr @.tmr.60, ; 60 ('android/widget/EdgeEffect')
	ptr @.tmr.61, ; 61 ('android/widget/EditText')
	ptr @.tmr.62, ; 62 ('android/widget/Filter')
	ptr @.tmr.63, ; 63 ('android/widget/Filter$FilterResults')
	ptr @.tmr.64, ; 64 ('android/widget/FrameLayout')
	ptr @.tmr.65, ; 65 ('android/widget/FrameLayout$LayoutParams')
	ptr @.tmr.66, ; 66 ('android/widget/HorizontalScrollView')
	ptr @.tmr.67, ; 67 ('android/widget/Adapter')
	ptr @.tmr.68, ; 68 ('android/widget/Filterable')
	ptr @.tmr.69, ; 69 ('android/widget/FilterQueryProvider')
	ptr @.tmr.70, ; 70 ('android/widget/ListAdapter')
	ptr @.tmr.71, ; 71 ('android/widget/ImageButton')
	ptr @.tmr.72, ; 72 ('android/widget/ImageView')
	ptr @.tmr.73, ; 73 ('android/widget/ImageView$ScaleType')
	ptr @.tmr.74, ; 74 ('android/widget/SectionIndexer')
	ptr @.tmr.75, ; 75 ('android/widget/SpinnerAdapter')
	ptr @.tmr.76, ; 76 ('android/widget/LinearLayout')
	ptr @.tmr.77, ; 77 ('android/widget/LinearLayout$LayoutParams')
	ptr @.tmr.78, ; 78 ('android/widget/ListView')
	ptr @.tmr.79, ; 79 ('android/widget/ProgressBar')
	ptr @.tmr.80, ; 80 ('android/widget/RadioButton')
	ptr @.tmr.81, ; 81 ('android/widget/SearchView')
	ptr @.tmr.82, ; 82 ('android/widget/SeekBar')
	ptr @.tmr.83, ; 83 ('android/widget/SeekBar$OnSeekBarChangeListener')
	ptr @.tmr.84, ; 84 ('android/widget/Switch')
	ptr @.tmr.85, ; 85 ('android/widget/TimePicker')
	ptr @.tmr.86, ; 86 ('android/util/DisplayMetrics')
	ptr @.tmr.87, ; 87 ('android/util/AttributeSet')
	ptr @.tmr.88, ; 88 ('android/util/Pair')
	ptr @.tmr.89, ; 89 ('android/util/SizeF')
	ptr @.tmr.90, ; 90 ('android/util/SparseArray')
	ptr @.tmr.91, ; 91 ('android/util/StateSet')
	ptr @.tmr.92, ; 92 ('android/util/TypedValue')
	ptr @.tmr.93, ; 93 ('mono/android/text/TextWatcherImplementor')
	ptr @.tmr.94, ; 94 ('android/text/Html')
	ptr @.tmr.95, ; 95 ('android/text/Editable')
	ptr @.tmr.96, ; 96 ('android/text/GetChars')
	ptr @.tmr.97, ; 97 ('android/text/InputFilter$LengthFilter')
	ptr @.tmr.98, ; 98 ('android/text/InputFilter')
	ptr @.tmr.99, ; 99 ('android/text/NoCopySpan')
	ptr @.tmr.100, ; 100 ('android/text/Spannable')
	ptr @.tmr.101, ; 101 ('android/text/Spanned')
	ptr @.tmr.102, ; 102 ('android/text/TextDirectionHeuristic')
	ptr @.tmr.103, ; 103 ('android/text/TextWatcher')
	ptr @.tmr.104, ; 104 ('android/text/Layout')
	ptr @.tmr.105, ; 105 ('android/text/Layout$Alignment')
	ptr @.tmr.106, ; 106 ('android/text/SpannableString')
	ptr @.tmr.107, ; 107 ('android/text/SpannableStringBuilder')
	ptr @.tmr.108, ; 108 ('android/text/SpannableStringInternal')
	ptr @.tmr.109, ; 109 ('android/text/StaticLayout')
	ptr @.tmr.110, ; 110 ('android/text/StaticLayout$Builder')
	ptr @.tmr.111, ; 111 ('android/text/TextPaint')
	ptr @.tmr.112, ; 112 ('android/text/TextUtils')
	ptr @.tmr.113, ; 113 ('android/text/TextUtils$TruncateAt')
	ptr @.tmr.114, ; 114 ('android/text/style/BackgroundColorSpan')
	ptr @.tmr.115, ; 115 ('android/text/style/BulletSpan')
	ptr @.tmr.116, ; 116 ('android/text/style/CharacterStyle')
	ptr @.tmr.117, ; 117 ('android/text/style/ClickableSpan')
	ptr @.tmr.118, ; 118 ('android/text/style/ForegroundColorSpan')
	ptr @.tmr.119, ; 119 ('android/text/style/LineHeightSpan')
	ptr @.tmr.120, ; 120 ('android/text/style/ParagraphStyle')
	ptr @.tmr.121, ; 121 ('android/text/style/WrapTogetherSpan')
	ptr @.tmr.122, ; 122 ('android/text/style/MetricAffectingSpan')
	ptr @.tmr.123, ; 123 ('android/text/style/StrikethroughSpan')
	ptr @.tmr.124, ; 124 ('android/text/style/StyleSpan')
	ptr @.tmr.125, ; 125 ('android/text/style/SubscriptSpan')
	ptr @.tmr.126, ; 126 ('android/text/style/SuperscriptSpan')
	ptr @.tmr.127, ; 127 ('android/text/style/TypefaceSpan')
	ptr @.tmr.128, ; 128 ('android/text/style/UnderlineSpan')
	ptr @.tmr.129, ; 129 ('android/text/method/BaseKeyListener')
	ptr @.tmr.130, ; 130 ('android/text/method/DigitsKeyListener')
	ptr @.tmr.131, ; 131 ('android/text/method/KeyListener')
	ptr @.tmr.132, ; 132 ('android/text/method/MovementMethod')
	ptr @.tmr.133, ; 133 ('android/text/method/MetaKeyKeyListener')
	ptr @.tmr.134, ; 134 ('android/text/method/NumberKeyListener')
	ptr @.tmr.135, ; 135 ('android/text/format/DateFormat')
	ptr @.tmr.136, ; 136 ('android/security/KeyStoreException')
	ptr @.tmr.137, ; 137 ('android/security/keystore/KeyGenParameterSpec')
	ptr @.tmr.138, ; 138 ('android/preference/PreferenceManager')
	ptr @.tmr.139, ; 139 ('android/opengl/Matrix')
	ptr @.tmr.140, ; 140 ('android/os/Handler')
	ptr @.tmr.141, ; 141 ('android/os/Message')
	ptr @.tmr.142, ; 142 ('android/os/PowerManager')
	ptr @.tmr.143, ; 143 ('android/os/BaseBundle')
	ptr @.tmr.144, ; 144 ('android/os/Build')
	ptr @.tmr.145, ; 145 ('android/os/Build$VERSION')
	ptr @.tmr.146, ; 146 ('android/os/Bundle')
	ptr @.tmr.147, ; 147 ('android/os/CancellationSignal')
	ptr @.tmr.148, ; 148 ('android/os/Environment')
	ptr @.tmr.149, ; 149 ('android/os/IBinder$DeathRecipient')
	ptr @.tmr.150, ; 150 ('android/os/IBinder')
	ptr @.tmr.151, ; 151 ('android/os/IBinder$FrozenStateChangeCallback')
	ptr @.tmr.152, ; 152 ('android/os/IInterface')
	ptr @.tmr.153, ; 153 ('android/os/Parcelable$Creator')
	ptr @.tmr.154, ; 154 ('android/os/Parcelable')
	ptr @.tmr.155, ; 155 ('android/os/LocaleList')
	ptr @.tmr.156, ; 156 ('android/os/Looper')
	ptr @.tmr.157, ; 157 ('android/os/Parcel')
	ptr @.tmr.158, ; 158 ('android/animation/Animator')
	ptr @.tmr.159, ; 159 ('android/animation/Animator$AnimatorListener')
	ptr @.tmr.160, ; 160 ('mono/android/animation/AnimatorEventDispatcher')
	ptr @.tmr.161, ; 161 ('android/animation/ValueAnimator')
	ptr @.tmr.162, ; 162 ('android/animation/ValueAnimator$AnimatorUpdateListener')
	ptr @.tmr.163, ; 163 ('mono/android/animation/ValueAnimator_AnimatorUpdateListenerImplementor')
	ptr @.tmr.164, ; 164 ('android/animation/ValueAnimator$DurationScaleChangeListener')
	ptr @.tmr.165, ; 165 ('android/animation/AnimatorListenerAdapter')
	ptr @.tmr.166, ; 166 ('android/animation/TimeInterpolator')
	ptr @.tmr.167, ; 167 ('android/view/WindowManager$LayoutParams')
	ptr @.tmr.168, ; 168 ('android/view/View')
	ptr @.tmr.169, ; 169 ('android/view/View$AccessibilityDelegate')
	ptr @.tmr.170, ; 170 ('android/view/View$DragShadowBuilder')
	ptr @.tmr.171, ; 171 ('android/view/View$MeasureSpec')
	ptr @.tmr.172, ; 172 ('android/view/View$OnAttachStateChangeListener')
	ptr @.tmr.173, ; 173 ('mono/android/view/View_OnAttachStateChangeListenerImplementor')
	ptr @.tmr.174, ; 174 ('android/view/View$OnClickListener')
	ptr @.tmr.175, ; 175 ('mono/android/view/View_OnClickListenerImplementor')
	ptr @.tmr.176, ; 176 ('android/view/View$OnDragListener')
	ptr @.tmr.177, ; 177 ('android/view/View$OnFocusChangeListener')
	ptr @.tmr.178, ; 178 ('mono/android/view/View_OnFocusChangeListenerImplementor')
	ptr @.tmr.179, ; 179 ('android/view/View$OnHoverListener')
	ptr @.tmr.180, ; 180 ('android/view/View$OnKeyListener')
	ptr @.tmr.181, ; 181 ('mono/android/view/View_OnKeyListenerImplementor')
	ptr @.tmr.182, ; 182 ('android/view/View$OnLayoutChangeListener')
	ptr @.tmr.183, ; 183 ('mono/android/view/View_OnLayoutChangeListenerImplementor')
	ptr @.tmr.184, ; 184 ('android/view/View$OnScrollChangeListener')
	ptr @.tmr.185, ; 185 ('mono/android/view/View_OnScrollChangeListenerImplementor')
	ptr @.tmr.186, ; 186 ('android/view/View$OnTouchListener')
	ptr @.tmr.187, ; 187 ('mono/android/view/View_OnTouchListenerImplementor')
	ptr @.tmr.188, ; 188 ('android/view/KeyEvent')
	ptr @.tmr.189, ; 189 ('android/view/LayoutInflater')
	ptr @.tmr.190, ; 190 ('android/view/MotionEvent')
	ptr @.tmr.191, ; 191 ('android/view/ViewTreeObserver')
	ptr @.tmr.192, ; 192 ('android/view/ViewTreeObserver$OnGlobalLayoutListener')
	ptr @.tmr.193, ; 193 ('android/view/Window')
	ptr @.tmr.194, ; 194 ('android/view/Window$Callback')
	ptr @.tmr.195, ; 195 ('android/view/ActionMode')
	ptr @.tmr.196, ; 196 ('android/view/ActionMode$Callback')
	ptr @.tmr.197, ; 197 ('android/view/ActionProvider')
	ptr @.tmr.198, ; 198 ('android/view/Choreographer')
	ptr @.tmr.199, ; 199 ('android/view/ContentInfo')
	ptr @.tmr.200, ; 200 ('android/view/ContextThemeWrapper')
	ptr @.tmr.201, ; 201 ('android/view/Display')
	ptr @.tmr.202, ; 202 ('android/view/DragEvent')
	ptr @.tmr.203, ; 203 ('android/view/GestureDetector')
	ptr @.tmr.204, ; 204 ('android/view/GestureDetector$OnDoubleTapListener')
	ptr @.tmr.205, ; 205 ('android/view/GestureDetector$OnGestureListener')
	ptr @.tmr.206, ; 206 ('android/view/ContextMenu$ContextMenuInfo')
	ptr @.tmr.207, ; 207 ('android/view/ContextMenu')
	ptr @.tmr.208, ; 208 ('android/view/Menu')
	ptr @.tmr.209, ; 209 ('android/view/MenuItem$OnActionExpandListener')
	ptr @.tmr.210, ; 210 ('android/view/MenuItem$OnMenuItemClickListener')
	ptr @.tmr.211, ; 211 ('android/view/MenuItem')
	ptr @.tmr.212, ; 212 ('android/view/InputEvent')
	ptr @.tmr.213, ; 213 ('android/view/SubMenu')
	ptr @.tmr.214, ; 214 ('android/view/SurfaceControlInputReceiver')
	ptr @.tmr.215, ; 215 ('android/view/ViewManager')
	ptr @.tmr.216, ; 216 ('android/view/ViewParent')
	ptr @.tmr.217, ; 217 ('android/view/WindowInsetsAnimationController')
	ptr @.tmr.218, ; 218 ('android/view/WindowInsetsAnimationControlListener')
	ptr @.tmr.219, ; 219 ('android/view/WindowInsetsController')
	ptr @.tmr.220, ; 220 ('android/view/WindowInsetsController$OnControllableInsetsChangedListener')
	ptr @.tmr.221, ; 221 ('android/view/WindowManager')
	ptr @.tmr.222, ; 222 ('android/view/KeyboardShortcutGroup')
	ptr @.tmr.223, ; 223 ('android/view/KeyboardShortcutInfo')
	ptr @.tmr.224, ; 224 ('android/view/MenuInflater')
	ptr @.tmr.225, ; 225 ('android/view/OrientationEventListener')
	ptr @.tmr.226, ; 226 ('android/view/ScaleGestureDetector')
	ptr @.tmr.227, ; 227 ('android/view/ScaleGestureDetector$OnScaleGestureListener')
	ptr @.tmr.228, ; 228 ('android/view/ScaleGestureDetector$SimpleOnScaleGestureListener')
	ptr @.tmr.229, ; 229 ('android/view/SearchEvent')
	ptr @.tmr.230, ; 230 ('android/view/SurfaceControl')
	ptr @.tmr.231, ; 231 ('android/view/ViewConfiguration')
	ptr @.tmr.232, ; 232 ('android/view/ViewGroup')
	ptr @.tmr.233, ; 233 ('android/view/ViewGroup$LayoutParams')
	ptr @.tmr.234, ; 234 ('android/view/ViewGroup$MarginLayoutParams')
	ptr @.tmr.235, ; 235 ('android/view/ViewGroup$OnHierarchyChangeListener')
	ptr @.tmr.236, ; 236 ('mono/android/view/ViewGroup_OnHierarchyChangeListenerImplementor')
	ptr @.tmr.237, ; 237 ('android/view/ViewPropertyAnimator')
	ptr @.tmr.238, ; 238 ('android/view/ViewStructure')
	ptr @.tmr.239, ; 239 ('android/view/WindowInsets')
	ptr @.tmr.240, ; 240 ('android/view/WindowInsetsAnimation')
	ptr @.tmr.241, ; 241 ('android/view/WindowInsetsAnimation$Bounds')
	ptr @.tmr.242, ; 242 ('android/view/WindowMetrics')
	ptr @.tmr.243, ; 243 ('android/view/contentcapture/ContentCaptureSession')
	ptr @.tmr.244, ; 244 ('android/view/autofill/AutofillId')
	ptr @.tmr.245, ; 245 ('android/view/animation/Animation')
	ptr @.tmr.246, ; 246 ('android/view/animation/Animation$AnimationListener')
	ptr @.tmr.247, ; 247 ('mono/android/view/animation/Animation_AnimationListenerImplementor')
	ptr @.tmr.248, ; 248 ('android/view/animation/AnimationSet')
	ptr @.tmr.249, ; 249 ('android/view/animation/AnimationUtils')
	ptr @.tmr.250, ; 250 ('android/view/animation/BaseInterpolator')
	ptr @.tmr.251, ; 251 ('android/view/animation/DecelerateInterpolator')
	ptr @.tmr.252, ; 252 ('android/view/animation/Interpolator')
	ptr @.tmr.253, ; 253 ('android/view/animation/LinearInterpolator')
	ptr @.tmr.254, ; 254 ('android/view/inputmethod/InputMethodManager')
	ptr @.tmr.255, ; 255 ('android/view/accessibility/AccessibilityEvent')
	ptr @.tmr.256, ; 256 ('android/view/accessibility/AccessibilityNodeInfo')
	ptr @.tmr.257, ; 257 ('android/view/accessibility/AccessibilityNodeInfo$ExtraRenderingInfo')
	ptr @.tmr.258, ; 258 ('android/view/accessibility/AccessibilityRecord')
	ptr @.tmr.259, ; 259 ('android/view/accessibility/AccessibilityWindowInfo')
	ptr @.tmr.260, ; 260 ('mono/android/runtime/InputStreamAdapter')
	ptr @.tmr.261, ; 261 ('mono/android/runtime/JavaArray')
	ptr @.tmr.262, ; 262 ('java/util/Collection')
	ptr @.tmr.263, ; 263 ('java/util/HashMap')
	ptr @.tmr.264, ; 264 ('java/util/ArrayList')
	ptr @.tmr.265, ; 265 ('mono/android/runtime/JavaObject')
	ptr @.tmr.266, ; 266 ('android/runtime/JavaProxyThrowable')
	ptr @.tmr.267, ; 267 ('java/util/HashSet')
	ptr @.tmr.268, ; 268 ('mono/android/runtime/OutputStreamAdapter')
	ptr @.tmr.269, ; 269 ('android/runtime/XmlReaderPullParser')
	ptr @.tmr.270, ; 270 ('android/net/Uri')
	ptr @.tmr.271, ; 271 ('android/graphics/Bitmap')
	ptr @.tmr.272, ; 272 ('android/graphics/Bitmap$CompressFormat')
	ptr @.tmr.273, ; 273 ('android/graphics/Bitmap$Config')
	ptr @.tmr.274, ; 274 ('android/graphics/Canvas')
	ptr @.tmr.275, ; 275 ('android/graphics/BitmapFactory')
	ptr @.tmr.276, ; 276 ('android/graphics/BitmapShader')
	ptr @.tmr.277, ; 277 ('android/graphics/BlendMode')
	ptr @.tmr.278, ; 278 ('android/graphics/BlurMaskFilter')
	ptr @.tmr.279, ; 279 ('android/graphics/BlurMaskFilter$Blur')
	ptr @.tmr.280, ; 280 ('android/graphics/ColorFilter')
	ptr @.tmr.281, ; 281 ('android/graphics/Color')
	ptr @.tmr.282, ; 282 ('android/graphics/DashPathEffect')
	ptr @.tmr.283, ; 283 ('android/graphics/Insets')
	ptr @.tmr.284, ; 284 ('android/graphics/LinearGradient')
	ptr @.tmr.285, ; 285 ('android/graphics/MaskFilter')
	ptr @.tmr.286, ; 286 ('android/graphics/Matrix')
	ptr @.tmr.287, ; 287 ('android/graphics/Paint')
	ptr @.tmr.288, ; 288 ('android/graphics/Paint$Cap')
	ptr @.tmr.289, ; 289 ('android/graphics/Paint$FontMetrics')
	ptr @.tmr.290, ; 290 ('android/graphics/Paint$FontMetricsInt')
	ptr @.tmr.291, ; 291 ('android/graphics/Paint$Join')
	ptr @.tmr.292, ; 292 ('android/graphics/Paint$Style')
	ptr @.tmr.293, ; 293 ('android/graphics/Path')
	ptr @.tmr.294, ; 294 ('android/graphics/Path$Direction')
	ptr @.tmr.295, ; 295 ('android/graphics/Path$FillType')
	ptr @.tmr.296, ; 296 ('android/graphics/Path$Op')
	ptr @.tmr.297, ; 297 ('android/graphics/PathEffect')
	ptr @.tmr.298, ; 298 ('android/graphics/Point')
	ptr @.tmr.299, ; 299 ('android/graphics/PointF')
	ptr @.tmr.300, ; 300 ('android/graphics/PorterDuff')
	ptr @.tmr.301, ; 301 ('android/graphics/PorterDuff$Mode')
	ptr @.tmr.302, ; 302 ('android/graphics/PorterDuffXfermode')
	ptr @.tmr.303, ; 303 ('android/graphics/RadialGradient')
	ptr @.tmr.304, ; 304 ('android/graphics/Rect')
	ptr @.tmr.305, ; 305 ('android/graphics/RectF')
	ptr @.tmr.306, ; 306 ('android/graphics/Region')
	ptr @.tmr.307, ; 307 ('android/graphics/Region$Op')
	ptr @.tmr.308, ; 308 ('android/graphics/Shader')
	ptr @.tmr.309, ; 309 ('android/graphics/Shader$TileMode')
	ptr @.tmr.310, ; 310 ('android/graphics/Typeface')
	ptr @.tmr.311, ; 311 ('android/graphics/Xfermode')
	ptr @.tmr.312, ; 312 ('android/graphics/drawable/Drawable')
	ptr @.tmr.313, ; 313 ('android/graphics/drawable/Drawable$ConstantState')
	ptr @.tmr.314, ; 314 ('android/graphics/drawable/DrawableContainer')
	ptr @.tmr.315, ; 315 ('android/graphics/drawable/InsetDrawable')
	ptr @.tmr.316, ; 316 ('android/graphics/drawable/LayerDrawable')
	ptr @.tmr.317, ; 317 ('android/graphics/drawable/AnimationDrawable')
	ptr @.tmr.318, ; 318 ('android/graphics/drawable/ColorDrawable')
	ptr @.tmr.319, ; 319 ('android/graphics/drawable/DrawableWrapper')
	ptr @.tmr.320, ; 320 ('android/graphics/drawable/GradientDrawable')
	ptr @.tmr.321, ; 321 ('android/graphics/drawable/GradientDrawable$Orientation')
	ptr @.tmr.322, ; 322 ('android/graphics/drawable/Animatable')
	ptr @.tmr.323, ; 323 ('android/graphics/drawable/Icon')
	ptr @.tmr.324, ; 324 ('android/graphics/drawable/PaintDrawable')
	ptr @.tmr.325, ; 325 ('android/graphics/drawable/RippleDrawable')
	ptr @.tmr.326, ; 326 ('android/graphics/drawable/ShapeDrawable')
	ptr @.tmr.327, ; 327 ('android/graphics/drawable/ShapeDrawable$ShaderFactory')
	ptr @.tmr.328, ; 328 ('android/graphics/drawable/StateListDrawable')
	ptr @.tmr.329, ; 329 ('android/graphics/drawable/shapes/OvalShape')
	ptr @.tmr.330, ; 330 ('android/graphics/drawable/shapes/RectShape')
	ptr @.tmr.331, ; 331 ('android/graphics/drawable/shapes/Shape')
	ptr @.tmr.332, ; 332 ('android/content/ContentProvider')
	ptr @.tmr.333, ; 333 ('android/content/ContentValues')
	ptr @.tmr.334, ; 334 ('android/content/Context')
	ptr @.tmr.335, ; 335 ('android/content/Intent')
	ptr @.tmr.336, ; 336 ('android/content/BroadcastReceiver')
	ptr @.tmr.337, ; 337 ('android/content/ClipData')
	ptr @.tmr.338, ; 338 ('android/content/ClipData$Item')
	ptr @.tmr.339, ; 339 ('android/content/ClipDescription')
	ptr @.tmr.340, ; 340 ('android/content/ComponentName')
	ptr @.tmr.341, ; 341 ('android/content/ContentResolver')
	ptr @.tmr.342, ; 342 ('android/content/ContextWrapper')
	ptr @.tmr.343, ; 343 ('android/content/DialogInterface$OnCancelListener')
	ptr @.tmr.344, ; 344 ('mono/android/content/DialogInterface_OnCancelListenerImplementor')
	ptr @.tmr.345, ; 345 ('android/content/DialogInterface$OnClickListener')
	ptr @.tmr.346, ; 346 ('mono/android/content/DialogInterface_OnClickListenerImplementor')
	ptr @.tmr.347, ; 347 ('android/content/DialogInterface$OnDismissListener')
	ptr @.tmr.348, ; 348 ('mono/android/content/DialogInterface_OnDismissListenerImplementor')
	ptr @.tmr.349, ; 349 ('android/content/DialogInterface$OnKeyListener')
	ptr @.tmr.350, ; 350 ('android/content/DialogInterface$OnMultiChoiceClickListener')
	ptr @.tmr.351, ; 351 ('android/content/DialogInterface$OnShowListener')
	ptr @.tmr.352, ; 352 ('mono/android/content/DialogInterface_OnShowListenerImplementor')
	ptr @.tmr.353, ; 353 ('android/content/DialogInterface')
	ptr @.tmr.354, ; 354 ('android/content/IntentFilter')
	ptr @.tmr.355, ; 355 ('android/content/IntentSender')
	ptr @.tmr.356, ; 356 ('android/content/SharedPreferences$Editor')
	ptr @.tmr.357, ; 357 ('android/content/SharedPreferences$OnSharedPreferenceChangeListener')
	ptr @.tmr.358, ; 358 ('android/content/SharedPreferences')
	ptr @.tmr.359, ; 359 ('android/content/res/AssetManager')
	ptr @.tmr.360, ; 360 ('android/content/res/ColorStateList')
	ptr @.tmr.361, ; 361 ('android/content/res/Configuration')
	ptr @.tmr.362, ; 362 ('android/content/res/Resources')
	ptr @.tmr.363, ; 363 ('android/content/res/Resources$Theme')
	ptr @.tmr.364, ; 364 ('android/content/res/TypedArray')
	ptr @.tmr.365, ; 365 ('android/content/pm/PackageManager')
	ptr @.tmr.366, ; 366 ('android/content/pm/ApplicationInfo')
	ptr @.tmr.367, ; 367 ('android/content/pm/PackageInfo')
	ptr @.tmr.368, ; 368 ('android/content/pm/PackageItemInfo')
	ptr @.tmr.369, ; 369 ('android/content/pm/ShortcutInfo')
	ptr @.tmr.370, ; 370 ('android/content/pm/ShortcutInfo$Builder')
	ptr @.tmr.371, ; 371 ('android/content/pm/ShortcutManager')
	ptr @.tmr.372, ; 372 ('android/content/pm/Signature')
	ptr @.tmr.373, ; 373 ('android/app/Activity')
	ptr @.tmr.374, ; 374 ('android/app/AlertDialog')
	ptr @.tmr.375, ; 375 ('android/app/AlertDialog$Builder')
	ptr @.tmr.376, ; 376 ('android/app/Application')
	ptr @.tmr.377, ; 377 ('android/app/Application$ActivityLifecycleCallbacks')
	ptr @.tmr.378, ; 378 ('android/app/DatePickerDialog')
	ptr @.tmr.379, ; 379 ('android/app/DatePickerDialog$OnDateSetListener')
	ptr @.tmr.380, ; 380 ('mono/android/app/DatePickerDialog_OnDateSetListenerImplementor')
	ptr @.tmr.381, ; 381 ('android/app/Dialog')
	ptr @.tmr.382, ; 382 ('android/app/TimePickerDialog')
	ptr @.tmr.383, ; 383 ('android/app/TimePickerDialog$OnTimeSetListener')
	ptr @.tmr.384, ; 384 ('mono/android/app/TimePickerDialog_OnTimeSetListenerImplementor')
	ptr @.tmr.385, ; 385 ('android/app/UiModeManager')
	ptr @.tmr.386, ; 386 ('android/app/PendingIntent')
	ptr @.tmr.387, ; 387 ('android/app/SearchableInfo')
	ptr @.tmr.388, ; 388 ('java/text/DecimalFormat')
	ptr @.tmr.389, ; 389 ('java/text/DecimalFormatSymbols')
	ptr @.tmr.390, ; 390 ('java/text/NumberFormat')
	ptr @.tmr.391, ; 391 ('java/text/Format')
	ptr @.tmr.392, ; 392 ('java/net/ConnectException')
	ptr @.tmr.393, ; 393 ('java/net/HttpURLConnection')
	ptr @.tmr.394, ; 394 ('java/net/InetSocketAddress')
	ptr @.tmr.395, ; 395 ('java/net/ProtocolException')
	ptr @.tmr.396, ; 396 ('java/net/Proxy')
	ptr @.tmr.397, ; 397 ('java/net/Proxy$Type')
	ptr @.tmr.398, ; 398 ('java/net/SocketAddress')
	ptr @.tmr.399, ; 399 ('java/net/SocketException')
	ptr @.tmr.400, ; 400 ('java/net/SocketTimeoutException')
	ptr @.tmr.401, ; 401 ('java/net/UnknownServiceException')
	ptr @.tmr.402, ; 402 ('java/net/URL')
	ptr @.tmr.403, ; 403 ('java/net/URLConnection')
	ptr @.tmr.404, ; 404 ('java/security/GeneralSecurityException')
	ptr @.tmr.405, ; 405 ('java/security/Key')
	ptr @.tmr.406, ; 406 ('java/security/Principal')
	ptr @.tmr.407, ; 407 ('java/security/PrivateKey')
	ptr @.tmr.408, ; 408 ('java/security/KeyFactory')
	ptr @.tmr.409, ; 409 ('java/security/KeyStore')
	ptr @.tmr.410, ; 410 ('java/security/KeyStoreException')
	ptr @.tmr.411, ; 411 ('java/security/SecureRandom')
	ptr @.tmr.412, ; 412 ('java/security/spec/EncodedKeySpec')
	ptr @.tmr.413, ; 413 ('java/security/spec/KeySpec')
	ptr @.tmr.414, ; 414 ('java/security/spec/PKCS8EncodedKeySpec')
	ptr @.tmr.415, ; 415 ('java/security/cert/Certificate')
	ptr @.tmr.416, ; 416 ('java/nio/Buffer')
	ptr @.tmr.417, ; 417 ('java/nio/ByteBuffer')
	ptr @.tmr.418, ; 418 ('java/nio/charset/Charset')
	ptr @.tmr.419, ; 419 ('java/nio/channels/FileChannel')
	ptr @.tmr.420, ; 420 ('java/nio/channels/spi/AbstractInterruptibleChannel')
	ptr @.tmr.421, ; 421 ('java/io/File')
	ptr @.tmr.422, ; 422 ('java/io/FileDescriptor')
	ptr @.tmr.423, ; 423 ('java/io/FileInputStream')
	ptr @.tmr.424, ; 424 ('java/io/FileNotFoundException')
	ptr @.tmr.425, ; 425 ('java/io/Closeable')
	ptr @.tmr.426, ; 426 ('java/io/InputStream')
	ptr @.tmr.427, ; 427 ('java/io/InterruptedIOException')
	ptr @.tmr.428, ; 428 ('java/io/IOException')
	ptr @.tmr.429, ; 429 ('java/io/Serializable')
	ptr @.tmr.430, ; 430 ('java/io/OutputStream')
	ptr @.tmr.431, ; 431 ('java/io/PrintWriter')
	ptr @.tmr.432, ; 432 ('java/io/RandomAccessFile')
	ptr @.tmr.433, ; 433 ('java/io/Reader')
	ptr @.tmr.434, ; 434 ('java/io/Writer')
	ptr @.tmr.435, ; 435 ('java/util/List')
	ptr @.tmr.436, ; 436 ('java/util/Comparator')
	ptr @.tmr.437, ; 437 ('java/util/Enumeration')
	ptr @.tmr.438, ; 438 ('java/util/Iterator')
	ptr @.tmr.439, ; 439 ('java/util/ListIterator')
	ptr @.tmr.440, ; 440 ('java/util/RandomAccess')
	ptr @.tmr.441, ; 441 ('java/util/SequencedCollection')
	ptr @.tmr.442, ; 442 ('java/util/Spliterator')
	ptr @.tmr.443, ; 443 ('java/util/Locale')
	ptr @.tmr.444, ; 444 ('java/util/Random')
	ptr @.tmr.445, ; 445 ('java/util/function/Consumer')
	ptr @.tmr.446, ; 446 ('java/util/function/Function')
	ptr @.tmr.447, ; 447 ('java/util/function/IntConsumer')
	ptr @.tmr.448, ; 448 ('java/util/function/IntFunction')
	ptr @.tmr.449, ; 449 ('java/util/function/Predicate')
	ptr @.tmr.450, ; 450 ('java/util/function/ToDoubleFunction')
	ptr @.tmr.451, ; 451 ('java/util/function/ToIntFunction')
	ptr @.tmr.452, ; 452 ('java/util/function/ToLongFunction')
	ptr @.tmr.453, ; 453 ('java/util/function/UnaryOperator')
	ptr @.tmr.454, ; 454 ('java/util/concurrent/Executor')
	ptr @.tmr.455, ; 455 ('java/util/concurrent/Future')
	ptr @.tmr.456, ; 456 ('java/util/concurrent/Future$State')
	ptr @.tmr.457, ; 457 ('java/util/concurrent/TimeUnit')
	ptr @.tmr.458, ; 458 ('java/lang/Boolean')
	ptr @.tmr.459, ; 459 ('java/lang/Byte')
	ptr @.tmr.460, ; 460 ('java/lang/Character')
	ptr @.tmr.461, ; 461 ('java/lang/Class')
	ptr @.tmr.462, ; 462 ('java/lang/ClassNotFoundException')
	ptr @.tmr.463, ; 463 ('java/lang/Double')
	ptr @.tmr.464, ; 464 ('java/lang/Exception')
	ptr @.tmr.465, ; 465 ('java/lang/Float')
	ptr @.tmr.466, ; 466 ('java/lang/CharSequence')
	ptr @.tmr.467, ; 467 ('java/lang/Integer')
	ptr @.tmr.468, ; 468 ('java/lang/Long')
	ptr @.tmr.469, ; 469 ('java/lang/Object')
	ptr @.tmr.470, ; 470 ('mono/java/lang/Runnable')
	ptr @.tmr.471, ; 471 ('java/lang/RuntimeException')
	ptr @.tmr.472, ; 472 ('java/lang/Short')
	ptr @.tmr.473, ; 473 ('java/lang/String')
	ptr @.tmr.474, ; 474 ('java/lang/Thread')
	ptr @.tmr.475, ; 475 ('mono/java/lang/RunnableImplementor')
	ptr @.tmr.476, ; 476 ('java/lang/Throwable')
	ptr @.tmr.477, ; 477 ('java/lang/ClassCastException')
	ptr @.tmr.478, ; 478 ('java/lang/ClassLoader')
	ptr @.tmr.479, ; 479 ('java/lang/Enum')
	ptr @.tmr.480, ; 480 ('java/lang/Error')
	ptr @.tmr.481, ; 481 ('java/lang/Appendable')
	ptr @.tmr.482, ; 482 ('java/lang/AutoCloseable')
	ptr @.tmr.483, ; 483 ('java/lang/Cloneable')
	ptr @.tmr.484, ; 484 ('java/lang/Iterable')
	ptr @.tmr.485, ; 485 ('java/lang/IllegalArgumentException')
	ptr @.tmr.486, ; 486 ('java/lang/IllegalStateException')
	ptr @.tmr.487, ; 487 ('java/lang/IndexOutOfBoundsException')
	ptr @.tmr.488, ; 488 ('java/lang/Runnable')
	ptr @.tmr.489, ; 489 ('java/lang/LinkageError')
	ptr @.tmr.490, ; 490 ('java/lang/NoClassDefFoundError')
	ptr @.tmr.491, ; 491 ('java/lang/NullPointerException')
	ptr @.tmr.492, ; 492 ('java/lang/Number')
	ptr @.tmr.493, ; 493 ('java/lang/ReflectiveOperationException')
	ptr @.tmr.494, ; 494 ('java/lang/SecurityException')
	ptr @.tmr.495, ; 495 ('java/lang/StackTraceElement')
	ptr @.tmr.496, ; 496 ('java/lang/UnsupportedOperationException')
	ptr @.tmr.497, ; 497 ('java/lang/Void')
	ptr @.tmr.498, ; 498 ('java/lang/annotation/Annotation')
	ptr @.tmr.499, ; 499 ('mono/android/TypeManager')
	ptr @.tmr.500, ; 500 ('androidx/activity/BackEventCompat')
	ptr @.tmr.501, ; 501 ('androidx/activity/ComponentActivity')
	ptr @.tmr.502, ; 502 ('androidx/activity/ComponentDialog')
	ptr @.tmr.503, ; 503 ('androidx/activity/FullyDrawnReporter')
	ptr @.tmr.504, ; 504 ('androidx/activity/OnBackPressedCallback')
	ptr @.tmr.505, ; 505 ('androidx/activity/OnBackPressedDispatcher')
	ptr @.tmr.506, ; 506 ('androidx/activity/result/ActivityResultLauncher')
	ptr @.tmr.507, ; 507 ('androidx/activity/result/ActivityResultRegistry')
	ptr @.tmr.508, ; 508 ('androidx/activity/result/ActivityResultCallback')
	ptr @.tmr.509, ; 509 ('androidx/activity/result/PickVisualMediaRequest')
	ptr @.tmr.510, ; 510 ('androidx/activity/result/contract/ActivityResultContract')
	ptr @.tmr.511, ; 511 ('androidx/activity/result/contract/ActivityResultContract$SynchronousResult')
	ptr @.tmr.512, ; 512 ('androidx/activity/result/contract/ActivityResultContracts')
	ptr @.tmr.513, ; 513 ('androidx/activity/result/contract/ActivityResultContracts$PickMultipleVisualMedia')
	ptr @.tmr.514, ; 514 ('androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia')
	ptr @.tmr.515, ; 515 ('androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$DefaultTab')
	ptr @.tmr.516, ; 516 ('androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$VisualMediaType')
	ptr @.tmr.517, ; 517 ('androidx/activity/contextaware/OnContextAvailableListener')
	ptr @.tmr.518, ; 518 ('mono/androidx/activity/contextaware/OnContextAvailableListenerImplementor')
	ptr @.tmr.519, ; 519 ('com/google/android/material/shape/CornerTreatment')
	ptr @.tmr.520, ; 520 ('com/google/android/material/shape/EdgeTreatment')
	ptr @.tmr.521, ; 521 ('com/google/android/material/shape/CornerSize')
	ptr @.tmr.522, ; 522 ('com/google/android/material/shape/MaterialShapeDrawable')
	ptr @.tmr.523, ; 523 ('com/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState')
	ptr @.tmr.524, ; 524 ('com/google/android/material/shape/ShapeAppearanceModel')
	ptr @.tmr.525, ; 525 ('com/google/android/material/shape/ShapeAppearanceModel$Builder')
	ptr @.tmr.526, ; 526 ('com/google/android/material/shape/ShapeAppearanceModel$CornerSizeUnaryOperator')
	ptr @.tmr.527, ; 527 ('com/google/android/material/shape/ShapePath')
	ptr @.tmr.528, ; 528 ('com/google/android/material/shape/ShapePathModel')
	ptr @.tmr.529, ; 529 ('com/google/android/material/imageview/ShapeableImageView')
	ptr @.tmr.530, ; 530 ('com/google/android/material/elevation/ElevationOverlayProvider')
	ptr @.tmr.531, ; 531 ('com/google/android/material/dialog/MaterialAlertDialogBuilder')
	ptr @.tmr.532, ; 532 ('com/google/android/material/checkbox/MaterialCheckBox')
	ptr @.tmr.533, ; 533 ('com/google/android/material/checkbox/MaterialCheckBox$OnCheckedStateChangedListener')
	ptr @.tmr.534, ; 534 ('mono/com/google/android/material/checkbox/MaterialCheckBox_OnCheckedStateChangedListenerImplementor')
	ptr @.tmr.535, ; 535 ('com/google/android/material/checkbox/MaterialCheckBox$OnErrorChangedListener')
	ptr @.tmr.536, ; 536 ('mono/com/google/android/material/checkbox/MaterialCheckBox_OnErrorChangedListenerImplementor')
	ptr @.tmr.537, ; 537 ('com/google/android/material/button/MaterialButton')
	ptr @.tmr.538, ; 538 ('com/google/android/material/button/MaterialButton$OnCheckedChangeListener')
	ptr @.tmr.539, ; 539 ('mono/com/google/android/material/button/MaterialButton_OnCheckedChangeListenerImplementor')
	ptr @.tmr.540, ; 540 ('com/google/android/material/bottomsheet/BottomSheetBehavior')
	ptr @.tmr.541, ; 541 ('com/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback')
	ptr @.tmr.542, ; 542 ('com/google/android/material/bottomsheet/BottomSheetDialog')
	ptr @.tmr.543, ; 543 ('com/google/android/material/badge/BadgeDrawable')
	ptr @.tmr.544, ; 544 ('com/google/android/material/navigation/NavigationBarView')
	ptr @.tmr.545, ; 545 ('com/google/android/material/navigation/NavigationBarView$OnItemReselectedListener')
	ptr @.tmr.546, ; 546 ('mono/com/google/android/material/navigation/NavigationBarView_OnItemReselectedListenerImplementor')
	ptr @.tmr.547, ; 547 ('com/google/android/material/navigation/NavigationBarView$OnItemSelectedListener')
	ptr @.tmr.548, ; 548 ('mono/com/google/android/material/navigation/NavigationBarView_OnItemSelectedListenerImplementor')
	ptr @.tmr.549, ; 549 ('com/google/android/material/navigation/NavigationBarItemView')
	ptr @.tmr.550, ; 550 ('com/google/android/material/navigation/NavigationBarMenuView')
	ptr @.tmr.551, ; 551 ('com/google/android/material/navigation/NavigationBarPresenter')
	ptr @.tmr.552, ; 552 ('com/google/android/material/navigation/NavigationView')
	ptr @.tmr.553, ; 553 ('com/google/android/material/navigation/NavigationView$OnNavigationItemSelectedListener')
	ptr @.tmr.554, ; 554 ('mono/com/google/android/material/navigation/NavigationView_OnNavigationItemSelectedListenerImplementor')
	ptr @.tmr.555, ; 555 ('com/google/android/material/tabs/TabLayout')
	ptr @.tmr.556, ; 556 ('com/google/android/material/tabs/TabLayout$TabView')
	ptr @.tmr.557, ; 557 ('com/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener')
	ptr @.tmr.558, ; 558 ('mono/com/google/android/material/tabs/TabLayout_BaseOnTabSelectedListenerImplementor')
	ptr @.tmr.559, ; 559 ('com/google/android/material/tabs/TabLayout$OnTabSelectedListener')
	ptr @.tmr.560, ; 560 ('com/google/android/material/tabs/TabLayout$Tab')
	ptr @.tmr.561, ; 561 ('com/google/android/material/tabs/TabLayoutMediator')
	ptr @.tmr.562, ; 562 ('com/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy')
	ptr @.tmr.563, ; 563 ('com/google/android/material/internal/StaticLayoutBuilderConfigurer')
	ptr @.tmr.564, ; 564 ('com/google/android/material/internal/ScrimInsetsFrameLayout')
	ptr @.tmr.565, ; 565 ('com/google/android/material/bottomnavigation/BottomNavigationItemView')
	ptr @.tmr.566, ; 566 ('com/google/android/material/bottomnavigation/BottomNavigationMenuView')
	ptr @.tmr.567, ; 567 ('com/google/android/material/bottomnavigation/BottomNavigationView')
	ptr @.tmr.568, ; 568 ('com/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemReselectedListener')
	ptr @.tmr.569, ; 569 ('com/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemSelectedListener')
	ptr @.tmr.570, ; 570 ('com/google/android/material/appbar/CollapsingToolbarLayout')
	ptr @.tmr.571, ; 571 ('com/google/android/material/appbar/CollapsingToolbarLayout$StaticLayoutBuilderConfigurer')
	ptr @.tmr.572, ; 572 ('com/google/android/material/appbar/AppBarLayout')
	ptr @.tmr.573, ; 573 ('com/google/android/material/appbar/AppBarLayout$BaseBehavior')
	ptr @.tmr.574, ; 574 ('com/google/android/material/appbar/AppBarLayout$BaseBehavior$BaseDragCallback')
	ptr @.tmr.575, ; 575 ('com/google/android/material/appbar/AppBarLayout$Behavior')
	ptr @.tmr.576, ; 576 ('com/google/android/material/appbar/AppBarLayout$ChildScrollEffect')
	ptr @.tmr.577, ; 577 ('com/google/android/material/appbar/AppBarLayout$LayoutParams')
	ptr @.tmr.578, ; 578 ('com/google/android/material/appbar/AppBarLayout$LiftOnScrollListener')
	ptr @.tmr.579, ; 579 ('mono/com/google/android/material/appbar/AppBarLayout_LiftOnScrollListenerImplementor')
	ptr @.tmr.580, ; 580 ('com/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener')
	ptr @.tmr.581, ; 581 ('mono/com/google/android/material/appbar/AppBarLayout_OnOffsetChangedListenerImplementor')
	ptr @.tmr.582, ; 582 ('com/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior')
	ptr @.tmr.583, ; 583 ('com/google/android/material/appbar/HeaderBehavior')
	ptr @.tmr.584, ; 584 ('com/google/android/material/appbar/HeaderScrollingViewBehavior')
	ptr @.tmr.585, ; 585 ('com/google/android/material/appbar/MaterialToolbar')
	ptr @.tmr.586, ; 586 ('com/google/android/material/appbar/ViewOffsetBehavior')
	ptr @.tmr.587, ; 587 ('androidx/navigation/fragment/FragmentNavigator')
	ptr @.tmr.588, ; 588 ('androidx/navigation/fragment/FragmentNavigator$Destination')
	ptr @.tmr.589, ; 589 ('androidx/navigation/fragment/NavHostFragment')
	ptr @.tmr.590, ; 590 ('androidx/core/util/Consumer')
	ptr @.tmr.591, ; 591 ('androidx/core/util/Predicate')
	ptr @.tmr.592, ; 592 ('androidx/core/util/Pair')
	ptr @.tmr.593, ; 593 ('androidx/core/os/LocaleListCompat')
	ptr @.tmr.594, ; 594 ('androidx/core/internal/view/SupportMenuItem')
	ptr @.tmr.595, ; 595 ('androidx/core/graphics/ColorUtils')
	ptr @.tmr.596, ; 596 ('androidx/core/graphics/Insets')
	ptr @.tmr.597, ; 597 ('androidx/core/graphics/drawable/DrawableCompat')
	ptr @.tmr.598, ; 598 ('androidx/core/content/ContextCompat')
	ptr @.tmr.599, ; 599 ('androidx/core/content/FileProvider')
	ptr @.tmr.600, ; 600 ('androidx/core/content/pm/PackageInfoCompat')
	ptr @.tmr.601, ; 601 ('androidx/core/app/ActivityOptionsCompat')
	ptr @.tmr.602, ; 602 ('androidx/core/app/ComponentActivity')
	ptr @.tmr.603, ; 603 ('androidx/core/app/ComponentActivity$ExtraData')
	ptr @.tmr.604, ; 604 ('androidx/core/app/SharedElementCallback')
	ptr @.tmr.605, ; 605 ('androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener')
	ptr @.tmr.606, ; 606 ('androidx/core/app/TaskStackBuilder')
	ptr @.tmr.607, ; 607 ('androidx/core/widget/NestedScrollView')
	ptr @.tmr.608, ; 608 ('androidx/core/widget/NestedScrollView$OnScrollChangeListener')
	ptr @.tmr.609, ; 609 ('mono/androidx/core/widget/NestedScrollView_OnScrollChangeListenerImplementor')
	ptr @.tmr.610, ; 610 ('androidx/core/widget/CompoundButtonCompat')
	ptr @.tmr.611, ; 611 ('androidx/core/widget/TextViewCompat')
	ptr @.tmr.612, ; 612 ('androidx/core/view/AccessibilityDelegateCompat')
	ptr @.tmr.613, ; 613 ('androidx/core/view/ActionProvider')
	ptr @.tmr.614, ; 614 ('androidx/core/view/ActionProvider$SubUiVisibilityListener')
	ptr @.tmr.615, ; 615 ('mono/androidx/core/view/ActionProvider_SubUiVisibilityListenerImplementor')
	ptr @.tmr.616, ; 616 ('androidx/core/view/ActionProvider$VisibilityListener')
	ptr @.tmr.617, ; 617 ('mono/androidx/core/view/ActionProvider_VisibilityListenerImplementor')
	ptr @.tmr.618, ; 618 ('androidx/core/view/ContentInfoCompat')
	ptr @.tmr.619, ; 619 ('androidx/core/view/DisplayCutoutCompat')
	ptr @.tmr.620, ; 620 ('androidx/core/view/MenuProvider')
	ptr @.tmr.621, ; 621 ('androidx/core/view/OnApplyWindowInsetsListener')
	ptr @.tmr.622, ; 622 ('androidx/core/view/OnReceiveContentListener')
	ptr @.tmr.623, ; 623 ('androidx/core/view/ScrollingView')
	ptr @.tmr.624, ; 624 ('androidx/core/view/ViewPropertyAnimatorListener')
	ptr @.tmr.625, ; 625 ('androidx/core/view/ViewPropertyAnimatorUpdateListener')
	ptr @.tmr.626, ; 626 ('androidx/core/view/WindowInsetsAnimationControlListenerCompat')
	ptr @.tmr.627, ; 627 ('androidx/core/view/MenuItemCompat')
	ptr @.tmr.628, ; 628 ('androidx/core/view/MenuItemCompat$OnActionExpandListener')
	ptr @.tmr.629, ; 629 ('androidx/core/view/PointerIconCompat')
	ptr @.tmr.630, ; 630 ('androidx/core/view/ScaleGestureDetectorCompat')
	ptr @.tmr.631, ; 631 ('androidx/core/view/ViewCompat')
	ptr @.tmr.632, ; 632 ('androidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat')
	ptr @.tmr.633, ; 633 ('androidx/core/view/ViewGroupCompat')
	ptr @.tmr.634, ; 634 ('androidx/core/view/ViewPropertyAnimatorCompat')
	ptr @.tmr.635, ; 635 ('androidx/core/view/ViewStructureCompat')
	ptr @.tmr.636, ; 636 ('androidx/core/view/WindowCompat')
	ptr @.tmr.637, ; 637 ('androidx/core/view/WindowInsetsAnimationCompat')
	ptr @.tmr.638, ; 638 ('androidx/core/view/WindowInsetsAnimationCompat$BoundsCompat')
	ptr @.tmr.639, ; 639 ('androidx/core/view/WindowInsetsAnimationCompat$Callback')
	ptr @.tmr.640, ; 640 ('androidx/core/view/WindowInsetsAnimationControllerCompat')
	ptr @.tmr.641, ; 641 ('androidx/core/view/WindowInsetsCompat')
	ptr @.tmr.642, ; 642 ('androidx/core/view/WindowInsetsCompat$Builder')
	ptr @.tmr.643, ; 643 ('androidx/core/view/WindowInsetsCompat$Type')
	ptr @.tmr.644, ; 644 ('androidx/core/view/WindowInsetsControllerCompat')
	ptr @.tmr.645, ; 645 ('androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener')
	ptr @.tmr.646, ; 646 ('mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor')
	ptr @.tmr.647, ; 647 ('androidx/core/view/contentcapture/ContentCaptureSessionCompat')
	ptr @.tmr.648, ; 648 ('androidx/core/view/autofill/AutofillIdCompat')
	ptr @.tmr.649, ; 649 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat')
	ptr @.tmr.650, ; 650 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat')
	ptr @.tmr.651, ; 651 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat')
	ptr @.tmr.652, ; 652 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat')
	ptr @.tmr.653, ; 653 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat')
	ptr @.tmr.654, ; 654 ('androidx/core/view/accessibility/AccessibilityNodeInfoCompat$TouchDelegateInfoCompat')
	ptr @.tmr.655, ; 655 ('androidx/core/view/accessibility/AccessibilityNodeProviderCompat')
	ptr @.tmr.656, ; 656 ('androidx/core/view/accessibility/AccessibilityWindowInfoCompat')
	ptr @.tmr.657, ; 657 ('androidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments')
	ptr @.tmr.658, ; 658 ('androidx/core/view/accessibility/AccessibilityViewCommand')
	ptr @.tmr.659, ; 659 ('androidx/core/text/PrecomputedTextCompat')
	ptr @.tmr.660, ; 660 ('androidx/core/text/PrecomputedTextCompat$Params')
	ptr @.tmr.661, ; 661 ('androidx/navigation/NavDirections')
	ptr @.tmr.662, ; 662 ('androidx/navigation/NavAction')
	ptr @.tmr.663, ; 663 ('androidx/navigation/NavArgument')
	ptr @.tmr.664, ; 664 ('androidx/navigation/NavBackStackEntry')
	ptr @.tmr.665, ; 665 ('androidx/navigation/NavDeepLink')
	ptr @.tmr.666, ; 666 ('androidx/navigation/NavDeepLinkRequest')
	ptr @.tmr.667, ; 667 ('androidx/navigation/NavDestination')
	ptr @.tmr.668, ; 668 ('androidx/navigation/NavDestination$DeepLinkMatch')
	ptr @.tmr.669, ; 669 ('androidx/navigation/NavGraph')
	ptr @.tmr.670, ; 670 ('androidx/navigation/NavGraphNavigator')
	ptr @.tmr.671, ; 671 ('androidx/navigation/Navigator')
	ptr @.tmr.672, ; 672 ('androidx/navigation/Navigator$Extras')
	ptr @.tmr.673, ; 673 ('androidx/navigation/NavigatorProvider')
	ptr @.tmr.674, ; 674 ('androidx/navigation/NavigatorState')
	ptr @.tmr.675, ; 675 ('androidx/navigation/NavOptions')
	ptr @.tmr.676, ; 676 ('androidx/navigation/NavType')
	ptr @.tmr.677, ; 677 ('androidx/navigation/internal/NavContext')
	ptr @.tmr.678, ; 678 ('androidx/swiperefreshlayout/widget/SwipeRefreshLayout')
	ptr @.tmr.679, ; 679 ('androidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback')
	ptr @.tmr.680, ; 680 ('androidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener')
	ptr @.tmr.681, ; 681 ('mono/androidx/swiperefreshlayout/widget/SwipeRefreshLayout_OnRefreshListenerImplementor')
	ptr @.tmr.682, ; 682 ('androidx/navigation/ui/AppBarConfiguration')
	ptr @.tmr.683, ; 683 ('androidx/navigation/ui/AppBarConfiguration$Builder')
	ptr @.tmr.684, ; 684 ('androidx/navigation/ui/AppBarConfiguration$OnNavigateUpListener')
	ptr @.tmr.685, ; 685 ('androidx/navigation/ui/NavigationUI')
	ptr @.tmr.686, ; 686 ('crc643f2b18b2570eaa5a/PlatformGraphicsView')
	ptr @.tmr.687, ; 687 ('androidx/cursoradapter/widget/CursorAdapter')
	ptr @.tmr.688, ; 688 ('androidx/lifecycle/ViewModelStoreOwner')
	ptr @.tmr.689, ; 689 ('androidx/lifecycle/ViewModel')
	ptr @.tmr.690, ; 690 ('androidx/lifecycle/ViewModelProvider')
	ptr @.tmr.691, ; 691 ('androidx/lifecycle/ViewModelProvider$Factory$Companion')
	ptr @.tmr.692, ; 692 ('androidx/lifecycle/ViewModelProvider$Factory')
	ptr @.tmr.693, ; 693 ('androidx/lifecycle/ViewModelStore')
	ptr @.tmr.694, ; 694 ('androidx/lifecycle/viewmodel/CreationExtras')
	ptr @.tmr.695, ; 695 ('androidx/lifecycle/viewmodel/CreationExtras$Key')
	ptr @.tmr.696, ; 696 ('androidx/lifecycle/viewmodel/ViewModelInitializer')
	ptr @.tmr.697, ; 697 ('androidx/cardview/widget/CardView')
	ptr @.tmr.698, ; 698 ('crc6488302ad6e9e4df1a/ImageLoaderResultCallback')
	ptr @.tmr.699, ; 699 ('crc6488302ad6e9e4df1a/ImageLoaderCallback')
	ptr @.tmr.700, ; 700 ('crc6488302ad6e9e4df1a/ImageLoaderCallbackBase_1')
	ptr @.tmr.701, ; 701 ('crc6488302ad6e9e4df1a/MauiAppCompatActivity')
	ptr @.tmr.702, ; 702 ('crc6488302ad6e9e4df1a/MauiAppCompatActivity_PredictiveBackCallback')
	ptr @.tmr.703, ; 703 ('crc6488302ad6e9e4df1a/MauiApplication')
	ptr @.tmr.704, ; 704 ('crc6488302ad6e9e4df1a/MauiApplication_ActivityLifecycleCallbacks')
	ptr @.tmr.705, ; 705 ('com/microsoft/maui/HybridJavaScriptInterface')
	ptr @.tmr.706, ; 706 ('com/microsoft/maui/ImageLoaderCallback')
	ptr @.tmr.707, ; 707 ('com/microsoft/maui/PlatformShadowDrawable')
	ptr @.tmr.708, ; 708 ('com/microsoft/maui/MauiViewGroup')
	ptr @.tmr.709, ; 709 ('com/microsoft/maui/PlatformAppCompatTextView')
	ptr @.tmr.710, ; 710 ('com/microsoft/maui/PlatformContentViewGroup')
	ptr @.tmr.711, ; 711 ('com/microsoft/maui/PlatformDispatcher')
	ptr @.tmr.712, ; 712 ('com/microsoft/maui/PlatformFontSpan')
	ptr @.tmr.713, ; 713 ('com/microsoft/maui/PlatformInterop')
	ptr @.tmr.714, ; 714 ('com/microsoft/maui/PlatformLineHeightSpan')
	ptr @.tmr.715, ; 715 ('com/microsoft/maui/PlatformLogger')
	ptr @.tmr.716, ; 716 ('com/microsoft/maui/PlatformMauiAppCompatActivity')
	ptr @.tmr.717, ; 717 ('com/microsoft/maui/PlatformPaintType')
	ptr @.tmr.718, ; 718 ('com/microsoft/maui/PlatformViewGroup')
	ptr @.tmr.719, ; 719 ('com/microsoft/maui/PlatformWrapperView')
	ptr @.tmr.720, ; 720 ('crc6452ffdc5b34af3a0f/AccessibilityDelegateCompatWrapper')
	ptr @.tmr.721, ; 721 ('crc6452ffdc5b34af3a0f/BorderDrawable')
	ptr @.tmr.722, ; 722 ('crc6452ffdc5b34af3a0f/ContainerView')
	ptr @.tmr.723, ; 723 ('crc6452ffdc5b34af3a0f/ContentViewGroup')
	ptr @.tmr.724, ; 724 ('crc6452ffdc5b34af3a0f/FragmentManagerExtensions_CallBacks')
	ptr @.tmr.725, ; 725 ('crc6452ffdc5b34af3a0f/LayoutViewGroup')
	ptr @.tmr.726, ; 726 ('crc6452ffdc5b34af3a0f/LocalizedDigitsKeyListener')
	ptr @.tmr.727, ; 727 ('crc6452ffdc5b34af3a0f/MauiAccessibilityDelegateCompat')
	ptr @.tmr.728, ; 728 ('crc6452ffdc5b34af3a0f/MauiAppCompatEditText')
	ptr @.tmr.729, ; 729 ('crc6452ffdc5b34af3a0f/MauiBoxView')
	ptr @.tmr.730, ; 730 ('crc6452ffdc5b34af3a0f/MauiDatePicker')
	ptr @.tmr.731, ; 731 ('crc6452ffdc5b34af3a0f/MauiHybridWebView')
	ptr @.tmr.732, ; 732 ('crc6452ffdc5b34af3a0f/MauiHybridWebViewClient')
	ptr @.tmr.733, ; 733 ('crc6452ffdc5b34af3a0f/MauiLayerDrawable')
	ptr @.tmr.734, ; 734 ('crc6452ffdc5b34af3a0f/MauiMaterialButton')
	ptr @.tmr.735, ; 735 ('crc6452ffdc5b34af3a0f/MauiMaterialButton_MauiResizableDrawable')
	ptr @.tmr.736, ; 736 ('crc6452ffdc5b34af3a0f/MauiMaterialContextThemeWrapper')
	ptr @.tmr.737, ; 737 ('crc6452ffdc5b34af3a0f/MauiPageControl')
	ptr @.tmr.738, ; 738 ('crc6452ffdc5b34af3a0f/MauiPageControl_TEditClickListener')
	ptr @.tmr.739, ; 739 ('crc6452ffdc5b34af3a0f/MauiPicker')
	ptr @.tmr.740, ; 740 ('crc6452ffdc5b34af3a0f/MauiPickerBase')
	ptr @.tmr.741, ; 741 ('crc6452ffdc5b34af3a0f/MauiScrollView')
	ptr @.tmr.742, ; 742 ('crc6452ffdc5b34af3a0f/MauiHorizontalScrollView')
	ptr @.tmr.743, ; 743 ('crc6452ffdc5b34af3a0f/MauiSearchView')
	ptr @.tmr.744, ; 744 ('crc6452ffdc5b34af3a0f/MauiShapeableImageView')
	ptr @.tmr.745, ; 745 ('crc6452ffdc5b34af3a0f/MauiShapeView')
	ptr @.tmr.746, ; 746 ('crc6452ffdc5b34af3a0f/MauiStepper')
	ptr @.tmr.747, ; 747 ('crc6452ffdc5b34af3a0f/MauiSwipeRefreshLayout')
	ptr @.tmr.748, ; 748 ('crc6452ffdc5b34af3a0f/MauiSwipeView')
	ptr @.tmr.749, ; 749 ('crc6452ffdc5b34af3a0f/MauiTextView')
	ptr @.tmr.750, ; 750 ('crc6452ffdc5b34af3a0f/MauiTimePicker')
	ptr @.tmr.751, ; 751 ('crc6452ffdc5b34af3a0f/MauiWebChromeClient')
	ptr @.tmr.752, ; 752 ('crc6452ffdc5b34af3a0f/MauiWebView')
	ptr @.tmr.753, ; 753 ('crc6452ffdc5b34af3a0f/MauiWebViewClient')
	ptr @.tmr.754, ; 754 ('crc6452ffdc5b34af3a0f/MauiWindowInsetListener')
	ptr @.tmr.755, ; 755 ('microsoft/maui/platform/MauiNavHostFragment')
	ptr @.tmr.756, ; 756 ('crc6452ffdc5b34af3a0f/NavigationRootManager_ElementBasedFragment')
	ptr @.tmr.757, ; 757 ('crc6452ffdc5b34af3a0f/NavigationViewFragment')
	ptr @.tmr.758, ; 758 ('crc6452ffdc5b34af3a0f/ScopedFragment')
	ptr @.tmr.759, ; 759 ('crc6452ffdc5b34af3a0f/StackNavigationManager_Callbacks')
	ptr @.tmr.760, ; 760 ('crc6452ffdc5b34af3a0f/ViewFragment')
	ptr @.tmr.761, ; 761 ('crc6452ffdc5b34af3a0f/PlatformTouchGraphicsView')
	ptr @.tmr.762, ; 762 ('crc6452ffdc5b34af3a0f/StepperHandlerHolder')
	ptr @.tmr.763, ; 763 ('crc6452ffdc5b34af3a0f/StepperHandlerManager_StepperListener')
	ptr @.tmr.764, ; 764 ('crc6452ffdc5b34af3a0f/SwipeViewPager')
	ptr @.tmr.765, ; 765 ('crc6452ffdc5b34af3a0f/WebViewExtensions_JavascriptResult')
	ptr @.tmr.766, ; 766 ('crc6452ffdc5b34af3a0f/WrapperView')
	ptr @.tmr.767, ; 767 ('crc64fcf28c0e24b4cc31/ButtonHandler_ButtonClickListener')
	ptr @.tmr.768, ; 768 ('crc64fcf28c0e24b4cc31/ButtonHandler_ButtonTouchListener')
	ptr @.tmr.769, ; 769 ('crc64fcf28c0e24b4cc31/HybridWebViewHandler_HybridWebViewJavaScriptInterface')
	ptr @.tmr.770, ; 770 ('crc64fcf28c0e24b4cc31/SearchBarHandler_FocusChangeListener')
	ptr @.tmr.771, ; 771 ('crc64fcf28c0e24b4cc31/SliderHandler_SeekBarChangeListener')
	ptr @.tmr.772, ; 772 ('crc64fcf28c0e24b4cc31/SwitchHandler_CheckedChangeListener')
	ptr @.tmr.773, ; 773 ('crc64fcf28c0e24b4cc31/ToolbarHandler_ProcessBackClick')
	ptr @.tmr.774, ; 774 ('crc64b5e713d400f589b7/LinearGradientShaderFactory')
	ptr @.tmr.775, ; 775 ('crc64b5e713d400f589b7/RadialGradientShaderFactory')
	ptr @.tmr.776, ; 776 ('crc64b5e713d400f589b7/MauiDrawable')
	ptr @.tmr.777, ; 777 ('crc64a096dc44ad241142/PlatformTicker_DurationScaleListener')
	ptr @.tmr.778, ; 778 ('androidx/loader/content/Loader')
	ptr @.tmr.779, ; 779 ('androidx/loader/content/Loader$OnLoadCanceledListener')
	ptr @.tmr.780, ; 780 ('androidx/loader/content/Loader$OnLoadCompleteListener')
	ptr @.tmr.781, ; 781 ('androidx/loader/app/LoaderManager')
	ptr @.tmr.782, ; 782 ('androidx/loader/app/LoaderManager$LoaderCallbacks')
	ptr @.tmr.783, ; 783 ('androidx/lifecycle/Observer')
	ptr @.tmr.784, ; 784 ('androidx/lifecycle/LiveData')
	ptr @.tmr.785, ; 785 ('androidx/lifecycle/MutableLiveData')
	ptr @.tmr.786, ; 786 ('androidx/navigation/NavController')
	ptr @.tmr.787, ; 787 ('androidx/navigation/NavController$OnDestinationChangedListener')
	ptr @.tmr.788, ; 788 ('mono/androidx/navigation/NavController_OnDestinationChangedListenerImplementor')
	ptr @.tmr.789, ; 789 ('androidx/navigation/NavDeepLinkBuilder')
	ptr @.tmr.790, ; 790 ('androidx/navigation/NavHostController')
	ptr @.tmr.791, ; 791 ('androidx/navigation/NavInflater')
	ptr @.tmr.792, ; 792 ('androidx/customview/widget/Openable')
	ptr @.tmr.793, ; 793 ('com/google/crypto/tink/shaded/protobuf/Internal')
	ptr @.tmr.794, ; 794 ('com/google/crypto/tink/shaded/protobuf/Internal$BooleanList')
	ptr @.tmr.795, ; 795 ('com/google/crypto/tink/shaded/protobuf/Internal$DoubleList')
	ptr @.tmr.796, ; 796 ('com/google/crypto/tink/shaded/protobuf/Internal$EnumLite')
	ptr @.tmr.797, ; 797 ('com/google/crypto/tink/shaded/protobuf/Internal$EnumLiteMap')
	ptr @.tmr.798, ; 798 ('com/google/crypto/tink/shaded/protobuf/Internal$FloatList')
	ptr @.tmr.799, ; 799 ('com/google/crypto/tink/shaded/protobuf/Internal$IntList')
	ptr @.tmr.800, ; 800 ('com/google/crypto/tink/shaded/protobuf/Internal$LongList')
	ptr @.tmr.801, ; 801 ('com/google/crypto/tink/shaded/protobuf/Internal$ProtobufList')
	ptr @.tmr.802, ; 802 ('com/google/crypto/tink/shaded/protobuf/AbstractMessageLite')
	ptr @.tmr.803, ; 803 ('com/google/crypto/tink/shaded/protobuf/ByteOutput')
	ptr @.tmr.804, ; 804 ('com/google/crypto/tink/shaded/protobuf/ByteString')
	ptr @.tmr.805, ; 805 ('com/google/crypto/tink/shaded/protobuf/ByteString$Output')
	ptr @.tmr.806, ; 806 ('com/google/crypto/tink/shaded/protobuf/CodedInputStream')
	ptr @.tmr.807, ; 807 ('com/google/crypto/tink/shaded/protobuf/CodedOutputStream')
	ptr @.tmr.808, ; 808 ('com/google/crypto/tink/shaded/protobuf/ExtensionLite')
	ptr @.tmr.809, ; 809 ('com/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite')
	ptr @.tmr.810, ; 810 ('com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite')
	ptr @.tmr.811, ; 811 ('com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$GeneratedExtension')
	ptr @.tmr.812, ; 812 ('com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$MethodToInvoke')
	ptr @.tmr.813, ; 813 ('com/google/crypto/tink/shaded/protobuf/MessageLite$Builder')
	ptr @.tmr.814, ; 814 ('com/google/crypto/tink/shaded/protobuf/MessageLite')
	ptr @.tmr.815, ; 815 ('com/google/crypto/tink/shaded/protobuf/MessageLiteOrBuilder')
	ptr @.tmr.816, ; 816 ('com/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException')
	ptr @.tmr.817, ; 817 ('com/google/crypto/tink/shaded/protobuf/Parser')
	ptr @.tmr.818, ; 818 ('com/google/crypto/tink/shaded/protobuf/LazyFieldLite')
	ptr @.tmr.819, ; 819 ('com/google/crypto/tink/shaded/protobuf/UnknownFieldSetLite')
	ptr @.tmr.820, ; 820 ('com/google/crypto/tink/shaded/protobuf/WireFormat')
	ptr @.tmr.821, ; 821 ('com/google/crypto/tink/shaded/protobuf/WireFormat$FieldType')
	ptr @.tmr.822, ; 822 ('com/google/crypto/tink/shaded/protobuf/WireFormat$JavaType')
	ptr @.tmr.823, ; 823 ('crc64f728827fec74e9c3/TapWindowTracker_GestureListener')
	ptr @.tmr.824, ; 824 ('crc64f728827fec74e9c3/Toolbar_Container')
	ptr @.tmr.825, ; 825 ('crc64338477404e88479c/ColorChangeRevealDrawable')
	ptr @.tmr.826, ; 826 ('crc64338477404e88479c/ControlsAccessibilityDelegate')
	ptr @.tmr.827, ; 827 ('crc64338477404e88479c/DragAndDropGestureHandler')
	ptr @.tmr.828, ; 828 ('crc64338477404e88479c/DragAndDropGestureHandler_CustomLocalStateData')
	ptr @.tmr.829, ; 829 ('crc64338477404e88479c/ToolbarExtensions_ToolbarTitleIconImageView')
	ptr @.tmr.830, ; 830 ('crc64338477404e88479c/FragmentContainer')
	ptr @.tmr.831, ; 831 ('crc64338477404e88479c/GenericAnimatorListener')
	ptr @.tmr.832, ; 832 ('crc64338477404e88479c/GenericGlobalLayoutListener')
	ptr @.tmr.833, ; 833 ('crc64338477404e88479c/GenericMenuClickListener')
	ptr @.tmr.834, ; 834 ('crc64338477404e88479c/GradientStrokeDrawable')
	ptr @.tmr.835, ; 835 ('crc64338477404e88479c/InnerGestureListener')
	ptr @.tmr.836, ; 836 ('crc64338477404e88479c/InnerScaleListener')
	ptr @.tmr.837, ; 837 ('crc64338477404e88479c/MauiViewPager')
	ptr @.tmr.838, ; 838 ('crc64338477404e88479c/MultiPageFragmentStateAdapter_1')
	ptr @.tmr.839, ; 839 ('crc64338477404e88479c/PointerGestureHandler')
	ptr @.tmr.840, ; 840 ('crc64338477404e88479c/TapAndPanGestureDetector')
	ptr @.tmr.841, ; 841 ('crc64338477404e88479c/ModalNavigationManager_ModalFragment')
	ptr @.tmr.842, ; 842 ('crc64338477404e88479c/ModalNavigationManager_ModalFragment_CustomComponentDialog')
	ptr @.tmr.843, ; 843 ('crc64338477404e88479c/ModalNavigationManager_ModalFragment_CustomComponentDialog_CallBack')
	ptr @.tmr.844, ; 844 ('crc640ec207abc449b2ca/ContainerView')
	ptr @.tmr.845, ; 845 ('crc640ec207abc449b2ca/CustomFrameLayout')
	ptr @.tmr.846, ; 846 ('crc640ec207abc449b2ca/ShellContentFragment')
	ptr @.tmr.847, ; 847 ('crc640ec207abc449b2ca/ShellFlyoutLayout')
	ptr @.tmr.848, ; 848 ('crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter')
	ptr @.tmr.849, ; 849 ('crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter_ShellLinearLayout')
	ptr @.tmr.850, ; 850 ('crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter_ElementViewHolder')
	ptr @.tmr.851, ; 851 ('crc640ec207abc449b2ca/ShellFlyoutRenderer')
	ptr @.tmr.852, ; 852 ('crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer')
	ptr @.tmr.853, ; 853 ('crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer_WindowsListener')
	ptr @.tmr.854, ; 854 ('crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer_HeaderContainer')
	ptr @.tmr.855, ; 855 ('crc640ec207abc449b2ca/RecyclerViewContainer')
	ptr @.tmr.856, ; 856 ('crc640ec207abc449b2ca/ScrollLayoutManager')
	ptr @.tmr.857, ; 857 ('crc640ec207abc449b2ca/ShellFragmentContainer')
	ptr @.tmr.858, ; 858 ('crc640ec207abc449b2ca/ShellFragmentStateAdapter')
	ptr @.tmr.859, ; 859 ('crc640ec207abc449b2ca/ShellItemRenderer')
	ptr @.tmr.860, ; 860 ('crc640ec207abc449b2ca/ShellItemRendererBase')
	ptr @.tmr.861, ; 861 ('crc640ec207abc449b2ca/ShellPageContainer')
	ptr @.tmr.862, ; 862 ('crc640ec207abc449b2ca/ShellSearchView')
	ptr @.tmr.863, ; 863 ('crc640ec207abc449b2ca/ShellSearchView_ClipDrawableWrapper')
	ptr @.tmr.864, ; 864 ('crc640ec207abc449b2ca/ShellSearchViewAdapter')
	ptr @.tmr.865, ; 865 ('crc640ec207abc449b2ca/ShellSearchViewAdapter_CustomFilter')
	ptr @.tmr.866, ; 866 ('crc640ec207abc449b2ca/ShellSearchViewAdapter_ObjectWrapper')
	ptr @.tmr.867, ; 867 ('crc640ec207abc449b2ca/ShellSectionRenderer')
	ptr @.tmr.868, ; 868 ('crc640ec207abc449b2ca/ShellSectionRenderer_ViewPagerPageChanged')
	ptr @.tmr.869, ; 869 ('crc640ec207abc449b2ca/ShellToolbarTracker')
	ptr @.tmr.870, ; 870 ('crc640ec207abc449b2ca/ShellToolbarTracker_FlyoutIconDrawerDrawable')
	ptr @.tmr.871, ; 871 ('crc649ff77a65592e7d55/TabbedPageManager_TempView')
	ptr @.tmr.872, ; 872 ('crc649ff77a65592e7d55/TabbedPageManager_Listeners')
	ptr @.tmr.873, ; 873 ('crc645d80431ce5f73f11/CarouselViewAdapter_2')
	ptr @.tmr.874, ; 874 ('crc645d80431ce5f73f11/EmptyViewAdapter')
	ptr @.tmr.875, ; 875 ('crc645d80431ce5f73f11/GroupableItemsViewAdapter_2')
	ptr @.tmr.876, ; 876 ('crc645d80431ce5f73f11/ItemsViewAdapter_2')
	ptr @.tmr.877, ; 877 ('crc645d80431ce5f73f11/ReorderableItemsViewAdapter_2')
	ptr @.tmr.878, ; 878 ('crc645d80431ce5f73f11/SelectableItemsViewAdapter_2')
	ptr @.tmr.879, ; 879 ('crc645d80431ce5f73f11/StructuredItemsViewAdapter_2')
	ptr @.tmr.880, ; 880 ('crc645d80431ce5f73f11/CarouselSpacingItemDecoration')
	ptr @.tmr.881, ; 881 ('crc645d80431ce5f73f11/CarouselViewOnScrollListener')
	ptr @.tmr.882, ; 882 ('crc645d80431ce5f73f11/DataChangeObserver')
	ptr @.tmr.883, ; 883 ('crc645d80431ce5f73f11/GridLayoutSpanSizeLookup')
	ptr @.tmr.884, ; 884 ('crc645d80431ce5f73f11/ItemContentView')
	ptr @.tmr.885, ; 885 ('crc645d80431ce5f73f11/MauiCarouselRecyclerView')
	ptr @.tmr.886, ; 886 ('crc645d80431ce5f73f11/MauiCarouselRecyclerView_CarouselViewOnGlobalLayoutListener')
	ptr @.tmr.887, ; 887 ('crc645d80431ce5f73f11/MauiRecyclerView_3')
	ptr @.tmr.888, ; 888 ('crc645d80431ce5f73f11/PositionalSmoothScroller')
	ptr @.tmr.889, ; 889 ('crc645d80431ce5f73f11/RecyclerViewScrollListener_2')
	ptr @.tmr.890, ; 890 ('crc645d80431ce5f73f11/ScrollHelper')
	ptr @.tmr.891, ; 891 ('crc645d80431ce5f73f11/SelectableViewHolder')
	ptr @.tmr.892, ; 892 ('crc645d80431ce5f73f11/SimpleItemTouchHelperCallback')
	ptr @.tmr.893, ; 893 ('crc645d80431ce5f73f11/SimpleViewHolder')
	ptr @.tmr.894, ; 894 ('crc645d80431ce5f73f11/SizedItemContentView')
	ptr @.tmr.895, ; 895 ('crc645d80431ce5f73f11/CenterSnapHelper')
	ptr @.tmr.896, ; 896 ('crc645d80431ce5f73f11/EdgeSnapHelper')
	ptr @.tmr.897, ; 897 ('crc645d80431ce5f73f11/EndSingleSnapHelper')
	ptr @.tmr.898, ; 898 ('crc645d80431ce5f73f11/EndSnapHelper')
	ptr @.tmr.899, ; 899 ('crc645d80431ce5f73f11/NongreedySnapHelper')
	ptr @.tmr.900, ; 900 ('crc645d80431ce5f73f11/NongreedySnapHelper_InitialScrollListener')
	ptr @.tmr.901, ; 901 ('crc645d80431ce5f73f11/SingleSnapHelper')
	ptr @.tmr.902, ; 902 ('crc645d80431ce5f73f11/StartSingleSnapHelper')
	ptr @.tmr.903, ; 903 ('crc645d80431ce5f73f11/StartSnapHelper')
	ptr @.tmr.904, ; 904 ('crc645d80431ce5f73f11/SpacingItemDecoration')
	ptr @.tmr.905, ; 905 ('crc645d80431ce5f73f11/TemplatedItemViewHolder')
	ptr @.tmr.906, ; 906 ('crc645d80431ce5f73f11/TextViewHolder')
	ptr @.tmr.907, ; 907 ('crc64e1fb321c08285b90/FrameRenderer')
	ptr @.tmr.908, ; 908 ('crc64e1fb321c08285b90/ViewRenderer')
	ptr @.tmr.909, ; 909 ('crc64e1fb321c08285b90/ViewRenderer_2')
	ptr @.tmr.910, ; 910 ('crc64e1fb321c08285b90/VisualElementRenderer_1')
	ptr @.tmr.911, ; 911 ('crc64e1fb321c08285b90/BaseCellView')
	ptr @.tmr.912, ; 912 ('crc64e1fb321c08285b90/CellAdapter')
	ptr @.tmr.913, ; 913 ('crc64e1fb321c08285b90/CellRenderer_RendererHolder')
	ptr @.tmr.914, ; 914 ('crc64e1fb321c08285b90/ConditionalFocusLayout')
	ptr @.tmr.915, ; 915 ('crc64e1fb321c08285b90/EntryCellEditText')
	ptr @.tmr.916, ; 916 ('crc64e1fb321c08285b90/EntryCellView')
	ptr @.tmr.917, ; 917 ('crc64e1fb321c08285b90/GroupedListViewAdapter')
	ptr @.tmr.918, ; 918 ('crc64e1fb321c08285b90/ListViewAdapter')
	ptr @.tmr.919, ; 919 ('crc64e1fb321c08285b90/ListViewRenderer')
	ptr @.tmr.920, ; 920 ('crc64e1fb321c08285b90/ListViewRenderer_Container')
	ptr @.tmr.921, ; 921 ('crc64e1fb321c08285b90/ListViewRenderer_SwipeRefreshLayoutWithFixedNestedScrolling')
	ptr @.tmr.922, ; 922 ('crc64e1fb321c08285b90/ListViewRenderer_ListViewSwipeRefreshLayoutListener')
	ptr @.tmr.923, ; 923 ('crc64e1fb321c08285b90/ListViewRenderer_ListViewScrollDetector')
	ptr @.tmr.924, ; 924 ('crc64e1fb321c08285b90/SwitchCellView')
	ptr @.tmr.925, ; 925 ('crc64e1fb321c08285b90/TextCellRenderer_TextCellView')
	ptr @.tmr.926, ; 926 ('crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer')
	ptr @.tmr.927, ; 927 ('crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer_TapGestureListener')
	ptr @.tmr.928, ; 928 ('crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer_LongPressGestureListener')
	ptr @.tmr.929, ; 929 ('crc64e1fb321c08285b90/TableViewModelRenderer')
	ptr @.tmr.930, ; 930 ('crc64e1fb321c08285b90/TableViewRenderer')
	ptr @.tmr.931, ; 931 ('androidx/appcompat/graphics/drawable/DrawerArrowDrawable')
	ptr @.tmr.932, ; 932 ('androidx/appcompat/widget/Toolbar')
	ptr @.tmr.933, ; 933 ('androidx/appcompat/widget/Toolbar_NavigationOnClickEventDispatcher')
	ptr @.tmr.934, ; 934 ('androidx/appcompat/widget/Toolbar$LayoutParams')
	ptr @.tmr.935, ; 935 ('androidx/appcompat/widget/Toolbar$OnMenuItemClickListener')
	ptr @.tmr.936, ; 936 ('mono/androidx/appcompat/widget/Toolbar_OnMenuItemClickListenerImplementor')
	ptr @.tmr.937, ; 937 ('androidx/appcompat/widget/AppCompatAutoCompleteTextView')
	ptr @.tmr.938, ; 938 ('androidx/appcompat/widget/AppCompatButton')
	ptr @.tmr.939, ; 939 ('androidx/appcompat/widget/AppCompatCheckBox')
	ptr @.tmr.940, ; 940 ('androidx/appcompat/widget/AppCompatEditText')
	ptr @.tmr.941, ; 941 ('androidx/appcompat/widget/AppCompatImageButton')
	ptr @.tmr.942, ; 942 ('androidx/appcompat/widget/AppCompatImageView')
	ptr @.tmr.943, ; 943 ('androidx/appcompat/widget/AppCompatRadioButton')
	ptr @.tmr.944, ; 944 ('androidx/appcompat/widget/AppCompatTextView')
	ptr @.tmr.945, ; 945 ('androidx/appcompat/widget/DecorToolbar')
	ptr @.tmr.946, ; 946 ('androidx/appcompat/widget/LinearLayoutCompat')
	ptr @.tmr.947, ; 947 ('androidx/appcompat/widget/LinearLayoutCompat$LayoutParams')
	ptr @.tmr.948, ; 948 ('androidx/appcompat/widget/ScrollingTabContainerView')
	ptr @.tmr.949, ; 949 ('androidx/appcompat/widget/ScrollingTabContainerView$VisibilityAnimListener')
	ptr @.tmr.950, ; 950 ('androidx/appcompat/widget/SearchView')
	ptr @.tmr.951, ; 951 ('androidx/appcompat/widget/SearchView$OnCloseListener')
	ptr @.tmr.952, ; 952 ('mono/androidx/appcompat/widget/SearchView_OnCloseListenerImplementor')
	ptr @.tmr.953, ; 953 ('androidx/appcompat/widget/SearchView$OnQueryTextListener')
	ptr @.tmr.954, ; 954 ('mono/androidx/appcompat/widget/SearchView_OnQueryTextListenerImplementor')
	ptr @.tmr.955, ; 955 ('androidx/appcompat/widget/SearchView$OnSuggestionListener')
	ptr @.tmr.956, ; 956 ('mono/androidx/appcompat/widget/SearchView_OnSuggestionListenerImplementor')
	ptr @.tmr.957, ; 957 ('androidx/appcompat/widget/SwitchCompat')
	ptr @.tmr.958, ; 958 ('androidx/appcompat/widget/TooltipCompat')
	ptr @.tmr.959, ; 959 ('androidx/appcompat/app/AlertDialog')
	ptr @.tmr.960, ; 960 ('androidx/appcompat/app/AlertDialog$Builder')
	ptr @.tmr.961, ; 961 ('androidx/appcompat/app/AlertDialog_IDialogInterfaceOnClickListenerImplementor')
	ptr @.tmr.962, ; 962 ('androidx/appcompat/app/AlertDialog_IDialogInterfaceOnCancelListenerImplementor')
	ptr @.tmr.963, ; 963 ('androidx/appcompat/app/AlertDialog_IDialogInterfaceOnMultiChoiceClickListenerImplementor')
	ptr @.tmr.964, ; 964 ('androidx/appcompat/app/ActionBar')
	ptr @.tmr.965, ; 965 ('androidx/appcompat/app/ActionBar$LayoutParams')
	ptr @.tmr.966, ; 966 ('androidx/appcompat/app/ActionBar$OnMenuVisibilityListener')
	ptr @.tmr.967, ; 967 ('mono/androidx/appcompat/app/ActionBar_OnMenuVisibilityListenerImplementor')
	ptr @.tmr.968, ; 968 ('androidx/appcompat/app/ActionBar$OnNavigationListener')
	ptr @.tmr.969, ; 969 ('androidx/appcompat/app/ActionBar$Tab')
	ptr @.tmr.970, ; 970 ('androidx/appcompat/app/ActionBar$TabListener')
	ptr @.tmr.971, ; 971 ('androidx/appcompat/app/ActionBarDrawerToggle')
	ptr @.tmr.972, ; 972 ('androidx/appcompat/app/ActionBarDrawerToggle$Delegate')
	ptr @.tmr.973, ; 973 ('androidx/appcompat/app/AppCompatActivity')
	ptr @.tmr.974, ; 974 ('androidx/appcompat/app/AppCompatDelegate')
	ptr @.tmr.975, ; 975 ('androidx/appcompat/app/AppCompatDialog')
	ptr @.tmr.976, ; 976 ('androidx/appcompat/app/AppCompatCallback')
	ptr @.tmr.977, ; 977 ('androidx/appcompat/view/ActionMode')
	ptr @.tmr.978, ; 978 ('androidx/appcompat/view/ActionMode$Callback')
	ptr @.tmr.979, ; 979 ('androidx/appcompat/view/menu/MenuBuilder')
	ptr @.tmr.980, ; 980 ('androidx/appcompat/view/menu/MenuBuilder$Callback')
	ptr @.tmr.981, ; 981 ('androidx/appcompat/view/menu/MenuPresenter$Callback')
	ptr @.tmr.982, ; 982 ('androidx/appcompat/view/menu/MenuPresenter')
	ptr @.tmr.983, ; 983 ('androidx/appcompat/view/menu/MenuView')
	ptr @.tmr.984, ; 984 ('androidx/appcompat/view/menu/MenuItemImpl')
	ptr @.tmr.985, ; 985 ('androidx/appcompat/view/menu/SubMenuBuilder')
	ptr @.tmr.986, ; 986 ('crc64f45d91b14e554859/MainActivity')
	ptr @.tmr.987, ; 987 ('crc64f45d91b14e554859/MainApplication')
	ptr @.tmr.988, ; 988 ('androidx/viewpager/widget/PagerAdapter')
	ptr @.tmr.989, ; 989 ('androidx/viewpager/widget/ViewPager')
	ptr @.tmr.990, ; 990 ('androidx/viewpager/widget/ViewPager$OnAdapterChangeListener')
	ptr @.tmr.991, ; 991 ('mono/androidx/viewpager/widget/ViewPager_OnAdapterChangeListenerImplementor')
	ptr @.tmr.992, ; 992 ('androidx/viewpager/widget/ViewPager$OnPageChangeListener')
	ptr @.tmr.993, ; 993 ('mono/androidx/viewpager/widget/ViewPager_OnPageChangeListenerImplementor')
	ptr @.tmr.994, ; 994 ('androidx/viewpager/widget/ViewPager$PageTransformer')
	ptr @.tmr.995, ; 995 ('crc6468b6408a11370c2f/WebAuthenticatorIntermediateActivity')
	ptr @.tmr.996, ; 996 ('microsoft/maui/essentials/fileProvider')
	ptr @.tmr.997, ; 997 ('crc64e53d2f592022988e/ConnectivityBroadcastReceiver')
	ptr @.tmr.998, ; 998 ('crc64ba438d8f48cf7e75/ActivityResultCallback_1')
	ptr @.tmr.999, ; 999 ('crc64ba438d8f48cf7e75/ActivityLifecycleContextListener')
	ptr @.tmr.1000, ; 1000 ('crc64ba438d8f48cf7e75/IntermediateActivity')
	ptr @.tmr.1001, ; 1001 ('crc640a8d9a12ddbf2cf2/DeviceDisplayImplementation_Listener')
	ptr @.tmr.1002, ; 1002 ('crc640a8d9a12ddbf2cf2/BatteryBroadcastReceiver')
	ptr @.tmr.1003, ; 1003 ('crc640a8d9a12ddbf2cf2/EnergySaverBroadcastReceiver')
	ptr @.tmr.1004, ; 1004 ('androidx/coordinatorlayout/widget/CoordinatorLayout')
	ptr @.tmr.1005, ; 1005 ('androidx/coordinatorlayout/widget/CoordinatorLayout$Behavior')
	ptr @.tmr.1006, ; 1006 ('androidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams')
	ptr @.tmr.1007, ; 1007 ('androidx/lifecycle/Lifecycle')
	ptr @.tmr.1008, ; 1008 ('androidx/lifecycle/Lifecycle$Event')
	ptr @.tmr.1009, ; 1009 ('androidx/lifecycle/Lifecycle$State')
	ptr @.tmr.1010, ; 1010 ('androidx/lifecycle/AtomicReference')
	ptr @.tmr.1011, ; 1011 ('androidx/lifecycle/LifecycleObserver')
	ptr @.tmr.1012, ; 1012 ('androidx/lifecycle/LifecycleOwner')
	ptr @.tmr.1013, ; 1013 ('kotlinx/coroutines/CoroutineScope')
	ptr @.tmr.1014, ; 1014 ('kotlinx/coroutines/flow/Flow')
	ptr @.tmr.1015, ; 1015 ('kotlinx/coroutines/flow/FlowCollector')
	ptr @.tmr.1016, ; 1016 ('kotlinx/coroutines/flow/MutableSharedFlow')
	ptr @.tmr.1017, ; 1017 ('kotlinx/coroutines/flow/MutableStateFlow')
	ptr @.tmr.1018, ; 1018 ('kotlinx/coroutines/flow/SharedFlow')
	ptr @.tmr.1019, ; 1019 ('kotlinx/coroutines/flow/StateFlow')
	ptr @.tmr.1020, ; 1020 ('kotlinx/serialization/DeserializationStrategy')
	ptr @.tmr.1021, ; 1021 ('kotlinx/serialization/KSerializer')
	ptr @.tmr.1022, ; 1022 ('kotlinx/serialization/SerializationStrategy')
	ptr @.tmr.1023, ; 1023 ('kotlinx/serialization/encoding/CompositeDecoder$Companion')
	ptr @.tmr.1024, ; 1024 ('kotlinx/serialization/encoding/CompositeDecoder')
	ptr @.tmr.1025, ; 1025 ('kotlinx/serialization/encoding/CompositeEncoder')
	ptr @.tmr.1026, ; 1026 ('kotlinx/serialization/encoding/Decoder')
	ptr @.tmr.1027, ; 1027 ('kotlinx/serialization/encoding/Encoder')
	ptr @.tmr.1028, ; 1028 ('kotlinx/serialization/descriptors/SerialDescriptor')
	ptr @.tmr.1029, ; 1029 ('kotlinx/serialization/descriptors/SerialKind')
	ptr @.tmr.1030, ; 1030 ('androidx/security/crypto/EncryptedSharedPreferences')
	ptr @.tmr.1031, ; 1031 ('androidx/security/crypto/EncryptedSharedPreferences$PrefKeyEncryptionScheme')
	ptr @.tmr.1032, ; 1032 ('androidx/security/crypto/EncryptedSharedPreferences$PrefValueEncryptionScheme')
	ptr @.tmr.1033, ; 1033 ('androidx/security/crypto/MasterKey')
	ptr @.tmr.1034, ; 1034 ('androidx/security/crypto/MasterKey$Builder')
	ptr @.tmr.1035, ; 1035 ('androidx/security/crypto/MasterKey$KeyScheme')
	ptr @.tmr.1036, ; 1036 ('androidx/lifecycle/SavedStateHandle')
	ptr @.tmr.1037, ; 1037 ('androidx/collection/SparseArrayCompat')
	ptr @.tmr.1038, ; 1038 ('androidx/recyclerview/widget/GridLayoutManager')
	ptr @.tmr.1039, ; 1039 ('androidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup')
	ptr @.tmr.1040, ; 1040 ('androidx/recyclerview/widget/ItemTouchUIUtil')
	ptr @.tmr.1041, ; 1041 ('androidx/recyclerview/widget/ItemTouchHelper')
	ptr @.tmr.1042, ; 1042 ('androidx/recyclerview/widget/ItemTouchHelper$Callback')
	ptr @.tmr.1043, ; 1043 ('androidx/recyclerview/widget/LinearLayoutManager')
	ptr @.tmr.1044, ; 1044 ('androidx/recyclerview/widget/LinearSmoothScroller')
	ptr @.tmr.1045, ; 1045 ('androidx/recyclerview/widget/LinearSnapHelper')
	ptr @.tmr.1046, ; 1046 ('androidx/recyclerview/widget/OrientationHelper')
	ptr @.tmr.1047, ; 1047 ('androidx/recyclerview/widget/PagerSnapHelper')
	ptr @.tmr.1048, ; 1048 ('androidx/recyclerview/widget/RecyclerView')
	ptr @.tmr.1049, ; 1049 ('androidx/recyclerview/widget/RecyclerView$Adapter')
	ptr @.tmr.1050, ; 1050 ('androidx/recyclerview/widget/RecyclerView$Adapter$StateRestorationPolicy')
	ptr @.tmr.1051, ; 1051 ('androidx/recyclerview/widget/RecyclerView$AdapterDataObserver')
	ptr @.tmr.1052, ; 1052 ('androidx/recyclerview/widget/RecyclerView$ChildDrawingOrderCallback')
	ptr @.tmr.1053, ; 1053 ('androidx/recyclerview/widget/RecyclerView$EdgeEffectFactory')
	ptr @.tmr.1054, ; 1054 ('androidx/recyclerview/widget/RecyclerView$ItemAnimator')
	ptr @.tmr.1055, ; 1055 ('androidx/recyclerview/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener')
	ptr @.tmr.1056, ; 1056 ('androidx/recyclerview/widget/RecyclerView$ItemAnimator$ItemHolderInfo')
	ptr @.tmr.1057, ; 1057 ('androidx/recyclerview/widget/RecyclerView$ItemDecoration')
	ptr @.tmr.1058, ; 1058 ('androidx/recyclerview/widget/RecyclerView$LayoutManager')
	ptr @.tmr.1059, ; 1059 ('androidx/recyclerview/widget/RecyclerView$LayoutManager$LayoutPrefetchRegistry')
	ptr @.tmr.1060, ; 1060 ('androidx/recyclerview/widget/RecyclerView$LayoutManager$Properties')
	ptr @.tmr.1061, ; 1061 ('androidx/recyclerview/widget/RecyclerView$LayoutParams')
	ptr @.tmr.1062, ; 1062 ('androidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener')
	ptr @.tmr.1063, ; 1063 ('mono/androidx/recyclerview/widget/RecyclerView_OnChildAttachStateChangeListenerImplementor')
	ptr @.tmr.1064, ; 1064 ('androidx/recyclerview/widget/RecyclerView$OnFlingListener')
	ptr @.tmr.1065, ; 1065 ('androidx/recyclerview/widget/RecyclerView$OnItemTouchListener')
	ptr @.tmr.1066, ; 1066 ('mono/androidx/recyclerview/widget/RecyclerView_OnItemTouchListenerImplementor')
	ptr @.tmr.1067, ; 1067 ('androidx/recyclerview/widget/RecyclerView$OnScrollListener')
	ptr @.tmr.1068, ; 1068 ('androidx/recyclerview/widget/RecyclerView$RecycledViewPool')
	ptr @.tmr.1069, ; 1069 ('androidx/recyclerview/widget/RecyclerView$Recycler')
	ptr @.tmr.1070, ; 1070 ('androidx/recyclerview/widget/RecyclerView$RecyclerListener')
	ptr @.tmr.1071, ; 1071 ('mono/androidx/recyclerview/widget/RecyclerView_RecyclerListenerImplementor')
	ptr @.tmr.1072, ; 1072 ('androidx/recyclerview/widget/RecyclerView$SmoothScroller')
	ptr @.tmr.1073, ; 1073 ('androidx/recyclerview/widget/RecyclerView$SmoothScroller$Action')
	ptr @.tmr.1074, ; 1074 ('androidx/recyclerview/widget/RecyclerView$State')
	ptr @.tmr.1075, ; 1075 ('androidx/recyclerview/widget/RecyclerView$ViewCacheExtension')
	ptr @.tmr.1076, ; 1076 ('androidx/recyclerview/widget/RecyclerView$ViewHolder')
	ptr @.tmr.1077, ; 1077 ('androidx/recyclerview/widget/RecyclerViewAccessibilityDelegate')
	ptr @.tmr.1078, ; 1078 ('androidx/recyclerview/widget/SnapHelper')
	ptr @.tmr.1079, ; 1079 ('androidx/fragment/app/FragmentActivity')
	ptr @.tmr.1080, ; 1080 ('androidx/fragment/app/DialogFragment')
	ptr @.tmr.1081, ; 1081 ('androidx/fragment/app/Fragment')
	ptr @.tmr.1082, ; 1082 ('androidx/fragment/app/Fragment$SavedState')
	ptr @.tmr.1083, ; 1083 ('androidx/fragment/app/FragmentContainer')
	ptr @.tmr.1084, ; 1084 ('androidx/fragment/app/FragmentContainerView')
	ptr @.tmr.1085, ; 1085 ('androidx/fragment/app/FragmentFactory')
	ptr @.tmr.1086, ; 1086 ('androidx/fragment/app/FragmentHostCallback')
	ptr @.tmr.1087, ; 1087 ('androidx/fragment/app/FragmentManager')
	ptr @.tmr.1088, ; 1088 ('androidx/fragment/app/FragmentManager$BackStackEntry')
	ptr @.tmr.1089, ; 1089 ('androidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks')
	ptr @.tmr.1090, ; 1090 ('androidx/fragment/app/FragmentManager$OnBackStackChangedListener')
	ptr @.tmr.1091, ; 1091 ('mono/androidx/fragment/app/FragmentManager_OnBackStackChangedListenerImplementor')
	ptr @.tmr.1092, ; 1092 ('androidx/fragment/app/FragmentTransaction')
	ptr @.tmr.1093, ; 1093 ('androidx/fragment/app/FragmentOnAttachListener')
	ptr @.tmr.1094, ; 1094 ('mono/androidx/fragment/app/FragmentOnAttachListenerImplementor')
	ptr @.tmr.1095, ; 1095 ('androidx/fragment/app/FragmentResultListener')
	ptr @.tmr.1096, ; 1096 ('androidx/fragment/app/strictmode/FragmentStrictMode')
	ptr @.tmr.1097, ; 1097 ('androidx/fragment/app/strictmode/FragmentStrictMode$Policy')
	ptr @.tmr.1098, ; 1098 ('androidx/fragment/app/strictmode/Violation')
	ptr @.tmr.1099, ; 1099 ('androidx/savedstate/SavedStateRegistry')
	ptr @.tmr.1100, ; 1100 ('androidx/savedstate/SavedStateRegistry$SavedStateProvider')
	ptr @.tmr.1101, ; 1101 ('androidx/appcompat/content/res/AppCompatResources')
	ptr @.tmr.1102, ; 1102 ('androidx/appcompat/graphics/drawable/DrawableWrapperCompat')
	ptr @.tmr.1103, ; 1103 ('kotlin/Function')
	ptr @.tmr.1104, ; 1104 ('kotlin/sequences/Sequence')
	ptr @.tmr.1105, ; 1105 ('kotlin/reflect/KAnnotatedElement')
	ptr @.tmr.1106, ; 1106 ('kotlin/reflect/KCallable')
	ptr @.tmr.1107, ; 1107 ('kotlin/reflect/KClass')
	ptr @.tmr.1108, ; 1108 ('kotlin/reflect/KClassifier')
	ptr @.tmr.1109, ; 1109 ('kotlin/reflect/KDeclarationContainer')
	ptr @.tmr.1110, ; 1110 ('kotlin/reflect/KFunction')
	ptr @.tmr.1111, ; 1111 ('kotlin/reflect/KParameter$Kind')
	ptr @.tmr.1112, ; 1112 ('kotlin/reflect/KParameter')
	ptr @.tmr.1113, ; 1113 ('kotlin/reflect/KType')
	ptr @.tmr.1114, ; 1114 ('kotlin/reflect/KTypeParameter')
	ptr @.tmr.1115, ; 1115 ('kotlin/reflect/KTypeProjection')
	ptr @.tmr.1116, ; 1116 ('kotlin/reflect/KTypeProjection$Companion')
	ptr @.tmr.1117, ; 1117 ('kotlin/reflect/KVariance')
	ptr @.tmr.1118, ; 1118 ('kotlin/reflect/KVisibility')
	ptr @.tmr.1119, ; 1119 ('kotlin/jvm/internal/markers/KMappedMarker')
	ptr @.tmr.1120, ; 1120 ('kotlin/jvm/functions/Function0')
	ptr @.tmr.1121, ; 1121 ('kotlin/jvm/functions/Function1')
	ptr @.tmr.1122, ; 1122 ('kotlin/jvm/functions/Function2')
	ptr @.tmr.1123, ; 1123 ('kotlin/enums/EnumEntries')
	ptr @.tmr.1124, ; 1124 ('kotlin/coroutines/Continuation')
	ptr @.tmr.1125, ; 1125 ('kotlin/coroutines/CoroutineContext$Key')
	ptr @.tmr.1126, ; 1126 ('kotlin/coroutines/CoroutineContext')
	ptr @.tmr.1127, ; 1127 ('androidx/viewpager2/widget/ViewPager2')
	ptr @.tmr.1128, ; 1128 ('androidx/viewpager2/widget/ViewPager2$OnPageChangeCallback')
	ptr @.tmr.1129, ; 1129 ('androidx/viewpager2/widget/ViewPager2$PageTransformer')
	ptr @.tmr.1130, ; 1130 ('androidx/viewpager2/adapter/FragmentStateAdapter')
	ptr @.tmr.1131, ; 1131 ('androidx/viewpager2/adapter/FragmentStateAdapter$FragmentTransactionCallback')
	ptr @.tmr.1132, ; 1132 ('androidx/viewpager2/adapter/FragmentStateAdapter$FragmentTransactionCallback$OnPostEventListener')
	ptr @.tmr.1133, ; 1133 ('androidx/viewpager2/adapter/FragmentViewHolder')
	ptr @.tmr.1134, ; 1134 ('androidx/drawerlayout/widget/DrawerLayout')
	ptr @.tmr.1135, ; 1135 ('androidx/drawerlayout/widget/DrawerLayout$DrawerListener')
	ptr @.tmr.1136, ; 1136 ('mono/androidx/drawerlayout/widget/DrawerLayout_DrawerListenerImplementor')
	ptr @.tmr.1137, ; 1137 ('androidx/drawerlayout/widget/DrawerLayout$LayoutParams')
	ptr @.tmr.1138, ; 1138 ('[Ljava/lang/Object;')
	ptr @.tmr.1139, ; 1139 ('[Z')
	ptr @.tmr.1140, ; 1140 ('[B')
	ptr @.tmr.1141, ; 1141 ('[C')
	ptr @.tmr.1142, ; 1142 ('[S')
	ptr @.tmr.1143, ; 1143 ('[I')
	ptr @.tmr.1144, ; 1144 ('[J')
	ptr @.tmr.1145, ; 1145 ('[F')
	ptr @.tmr.1146, ; 1146 ('[D')
	ptr @.tmr.1147, ; 1147 ('net/dot/jni/internal/JavaProxyObject')
	ptr @.tmr.1148, ; 1148 ('net/dot/jni/internal/JavaProxyThrowable')
	ptr @.tmr.1149 ; 1149 ('net/dot/jni/ManagedPeer')
], align 4

; Strings
@.tmr.0 = private unnamed_addr constant [29 x i8] c"org/xmlpull/v1/XmlPullParser\00", align 1
@.tmr.1 = private unnamed_addr constant [38 x i8] c"org/xmlpull/v1/XmlPullParserException\00", align 1
@.tmr.2 = private unnamed_addr constant [32 x i8] c"javax/security/cert/Certificate\00", align 1
@.tmr.3 = private unnamed_addr constant [36 x i8] c"javax/security/cert/X509Certificate\00", align 1
@.tmr.4 = private unnamed_addr constant [28 x i8] c"javax/security/auth/Subject\00", align 1
@.tmr.5 = private unnamed_addr constant [24 x i8] c"javax/net/SocketFactory\00", align 1
@.tmr.6 = private unnamed_addr constant [33 x i8] c"javax/net/ssl/HttpsURLConnection\00", align 1
@.tmr.7 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/HostnameVerifier\00", align 1
@.tmr.8 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/KeyManager\00", align 1
@.tmr.9 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLSession\00", align 1
@.tmr.10 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/SSLSessionContext\00", align 1
@.tmr.11 = private unnamed_addr constant [27 x i8] c"javax/net/ssl/TrustManager\00", align 1
@.tmr.12 = private unnamed_addr constant [32 x i8] c"javax/net/ssl/KeyManagerFactory\00", align 1
@.tmr.13 = private unnamed_addr constant [25 x i8] c"javax/net/ssl/SSLContext\00", align 1
@.tmr.14 = private unnamed_addr constant [31 x i8] c"javax/net/ssl/SSLSocketFactory\00", align 1
@.tmr.15 = private unnamed_addr constant [34 x i8] c"javax/net/ssl/TrustManagerFactory\00", align 1
@.tmr.16 = private unnamed_addr constant [33 x i8] c"javax/crypto/BadPaddingException\00", align 1
@.tmr.17 = private unnamed_addr constant [25 x i8] c"android/window/BackEvent\00", align 1
@.tmr.18 = private unnamed_addr constant [34 x i8] c"android/window/InputTransferToken\00", align 1
@.tmr.19 = private unnamed_addr constant [37 x i8] c"android/window/OnBackInvokedCallback\00", align 1
@.tmr.20 = private unnamed_addr constant [39 x i8] c"android/window/OnBackInvokedDispatcher\00", align 1
@.tmr.21 = private unnamed_addr constant [45 x i8] c"android/window/TrustedPresentationThresholds\00", align 1
@.tmr.22 = private unnamed_addr constant [29 x i8] c"android/webkit/CookieManager\00", align 1
@.tmr.23 = private unnamed_addr constant [29 x i8] c"android/webkit/ValueCallback\00", align 1
@.tmr.24 = private unnamed_addr constant [34 x i8] c"android/webkit/WebResourceRequest\00", align 1
@.tmr.25 = private unnamed_addr constant [39 x i8] c"android/webkit/RenderProcessGoneDetail\00", align 1
@.tmr.26 = private unnamed_addr constant [31 x i8] c"android/webkit/WebChromeClient\00", align 1
@.tmr.27 = private unnamed_addr constant [50 x i8] c"android/webkit/WebChromeClient$CustomViewCallback\00", align 1
@.tmr.28 = private unnamed_addr constant [49 x i8] c"android/webkit/WebChromeClient$FileChooserParams\00", align 1
@.tmr.29 = private unnamed_addr constant [26 x i8] c"android/webkit/WebMessage\00", align 1
@.tmr.30 = private unnamed_addr constant [32 x i8] c"android/webkit/WebResourceError\00", align 1
@.tmr.31 = private unnamed_addr constant [35 x i8] c"android/webkit/WebResourceResponse\00", align 1
@.tmr.32 = private unnamed_addr constant [27 x i8] c"android/webkit/WebSettings\00", align 1
@.tmr.33 = private unnamed_addr constant [23 x i8] c"android/webkit/WebView\00", align 1
@.tmr.34 = private unnamed_addr constant [29 x i8] c"android/webkit/WebViewClient\00", align 1
@.tmr.35 = private unnamed_addr constant [33 x i8] c"android/database/CharArrayBuffer\00", align 1
@.tmr.36 = private unnamed_addr constant [33 x i8] c"android/database/ContentObserver\00", align 1
@.tmr.37 = private unnamed_addr constant [33 x i8] c"android/database/DataSetObserver\00", align 1
@.tmr.38 = private unnamed_addr constant [24 x i8] c"android/database/Cursor\00", align 1
@.tmr.39 = private unnamed_addr constant [27 x i8] c"android/widget/AbsListView\00", align 1
@.tmr.40 = private unnamed_addr constant [44 x i8] c"android/widget/AbsListView$OnScrollListener\00", align 1
@.tmr.41 = private unnamed_addr constant [27 x i8] c"android/widget/AdapterView\00", align 1
@.tmr.42 = private unnamed_addr constant [47 x i8] c"android/widget/AdapterView$OnItemClickListener\00", align 1
@.tmr.43 = private unnamed_addr constant [63 x i8] c"mono/android/widget/AdapterView_OnItemClickListenerImplementor\00", align 1
@.tmr.44 = private unnamed_addr constant [51 x i8] c"android/widget/AdapterView$OnItemLongClickListener\00", align 1
@.tmr.45 = private unnamed_addr constant [50 x i8] c"android/widget/AdapterView$OnItemSelectedListener\00", align 1
@.tmr.46 = private unnamed_addr constant [36 x i8] c"android/widget/AutoCompleteTextView\00", align 1
@.tmr.47 = private unnamed_addr constant [27 x i8] c"android/widget/BaseAdapter\00", align 1
@.tmr.48 = private unnamed_addr constant [26 x i8] c"android/widget/DatePicker\00", align 1
@.tmr.49 = private unnamed_addr constant [24 x i8] c"android/widget/TextView\00", align 1
@.tmr.50 = private unnamed_addr constant [35 x i8] c"android/widget/TextView$BufferType\00", align 1
@.tmr.51 = private unnamed_addr constant [47 x i8] c"android/widget/TextView$OnEditorActionListener\00", align 1
@.tmr.52 = private unnamed_addr constant [63 x i8] c"mono/android/widget/TextView_OnEditorActionListenerImplementor\00", align 1
@.tmr.53 = private unnamed_addr constant [30 x i8] c"android/widget/AbsoluteLayout\00", align 1
@.tmr.54 = private unnamed_addr constant [26 x i8] c"android/widget/AbsSeekBar\00", align 1
@.tmr.55 = private unnamed_addr constant [22 x i8] c"android/widget/Button\00", align 1
@.tmr.56 = private unnamed_addr constant [24 x i8] c"android/widget/CheckBox\00", align 1
@.tmr.57 = private unnamed_addr constant [30 x i8] c"android/widget/CompoundButton\00", align 1
@.tmr.58 = private unnamed_addr constant [54 x i8] c"android/widget/CompoundButton$OnCheckedChangeListener\00", align 1
@.tmr.59 = private unnamed_addr constant [70 x i8] c"mono/android/widget/CompoundButton_OnCheckedChangeListenerImplementor\00", align 1
@.tmr.60 = private unnamed_addr constant [26 x i8] c"android/widget/EdgeEffect\00", align 1
@.tmr.61 = private unnamed_addr constant [24 x i8] c"android/widget/EditText\00", align 1
@.tmr.62 = private unnamed_addr constant [22 x i8] c"android/widget/Filter\00", align 1
@.tmr.63 = private unnamed_addr constant [36 x i8] c"android/widget/Filter$FilterResults\00", align 1
@.tmr.64 = private unnamed_addr constant [27 x i8] c"android/widget/FrameLayout\00", align 1
@.tmr.65 = private unnamed_addr constant [40 x i8] c"android/widget/FrameLayout$LayoutParams\00", align 1
@.tmr.66 = private unnamed_addr constant [36 x i8] c"android/widget/HorizontalScrollView\00", align 1
@.tmr.67 = private unnamed_addr constant [23 x i8] c"android/widget/Adapter\00", align 1
@.tmr.68 = private unnamed_addr constant [26 x i8] c"android/widget/Filterable\00", align 1
@.tmr.69 = private unnamed_addr constant [35 x i8] c"android/widget/FilterQueryProvider\00", align 1
@.tmr.70 = private unnamed_addr constant [27 x i8] c"android/widget/ListAdapter\00", align 1
@.tmr.71 = private unnamed_addr constant [27 x i8] c"android/widget/ImageButton\00", align 1
@.tmr.72 = private unnamed_addr constant [25 x i8] c"android/widget/ImageView\00", align 1
@.tmr.73 = private unnamed_addr constant [35 x i8] c"android/widget/ImageView$ScaleType\00", align 1
@.tmr.74 = private unnamed_addr constant [30 x i8] c"android/widget/SectionIndexer\00", align 1
@.tmr.75 = private unnamed_addr constant [30 x i8] c"android/widget/SpinnerAdapter\00", align 1
@.tmr.76 = private unnamed_addr constant [28 x i8] c"android/widget/LinearLayout\00", align 1
@.tmr.77 = private unnamed_addr constant [41 x i8] c"android/widget/LinearLayout$LayoutParams\00", align 1
@.tmr.78 = private unnamed_addr constant [24 x i8] c"android/widget/ListView\00", align 1
@.tmr.79 = private unnamed_addr constant [27 x i8] c"android/widget/ProgressBar\00", align 1
@.tmr.80 = private unnamed_addr constant [27 x i8] c"android/widget/RadioButton\00", align 1
@.tmr.81 = private unnamed_addr constant [26 x i8] c"android/widget/SearchView\00", align 1
@.tmr.82 = private unnamed_addr constant [23 x i8] c"android/widget/SeekBar\00", align 1
@.tmr.83 = private unnamed_addr constant [47 x i8] c"android/widget/SeekBar$OnSeekBarChangeListener\00", align 1
@.tmr.84 = private unnamed_addr constant [22 x i8] c"android/widget/Switch\00", align 1
@.tmr.85 = private unnamed_addr constant [26 x i8] c"android/widget/TimePicker\00", align 1
@.tmr.86 = private unnamed_addr constant [28 x i8] c"android/util/DisplayMetrics\00", align 1
@.tmr.87 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 1
@.tmr.88 = private unnamed_addr constant [18 x i8] c"android/util/Pair\00", align 1
@.tmr.89 = private unnamed_addr constant [19 x i8] c"android/util/SizeF\00", align 1
@.tmr.90 = private unnamed_addr constant [25 x i8] c"android/util/SparseArray\00", align 1
@.tmr.91 = private unnamed_addr constant [22 x i8] c"android/util/StateSet\00", align 1
@.tmr.92 = private unnamed_addr constant [24 x i8] c"android/util/TypedValue\00", align 1
@.tmr.93 = private unnamed_addr constant [41 x i8] c"mono/android/text/TextWatcherImplementor\00", align 1
@.tmr.94 = private unnamed_addr constant [18 x i8] c"android/text/Html\00", align 1
@.tmr.95 = private unnamed_addr constant [22 x i8] c"android/text/Editable\00", align 1
@.tmr.96 = private unnamed_addr constant [22 x i8] c"android/text/GetChars\00", align 1
@.tmr.97 = private unnamed_addr constant [38 x i8] c"android/text/InputFilter$LengthFilter\00", align 1
@.tmr.98 = private unnamed_addr constant [25 x i8] c"android/text/InputFilter\00", align 1
@.tmr.99 = private unnamed_addr constant [24 x i8] c"android/text/NoCopySpan\00", align 1
@.tmr.100 = private unnamed_addr constant [23 x i8] c"android/text/Spannable\00", align 1
@.tmr.101 = private unnamed_addr constant [21 x i8] c"android/text/Spanned\00", align 1
@.tmr.102 = private unnamed_addr constant [36 x i8] c"android/text/TextDirectionHeuristic\00", align 1
@.tmr.103 = private unnamed_addr constant [25 x i8] c"android/text/TextWatcher\00", align 1
@.tmr.104 = private unnamed_addr constant [20 x i8] c"android/text/Layout\00", align 1
@.tmr.105 = private unnamed_addr constant [30 x i8] c"android/text/Layout$Alignment\00", align 1
@.tmr.106 = private unnamed_addr constant [29 x i8] c"android/text/SpannableString\00", align 1
@.tmr.107 = private unnamed_addr constant [36 x i8] c"android/text/SpannableStringBuilder\00", align 1
@.tmr.108 = private unnamed_addr constant [37 x i8] c"android/text/SpannableStringInternal\00", align 1
@.tmr.109 = private unnamed_addr constant [26 x i8] c"android/text/StaticLayout\00", align 1
@.tmr.110 = private unnamed_addr constant [34 x i8] c"android/text/StaticLayout$Builder\00", align 1
@.tmr.111 = private unnamed_addr constant [23 x i8] c"android/text/TextPaint\00", align 1
@.tmr.112 = private unnamed_addr constant [23 x i8] c"android/text/TextUtils\00", align 1
@.tmr.113 = private unnamed_addr constant [34 x i8] c"android/text/TextUtils$TruncateAt\00", align 1
@.tmr.114 = private unnamed_addr constant [39 x i8] c"android/text/style/BackgroundColorSpan\00", align 1
@.tmr.115 = private unnamed_addr constant [30 x i8] c"android/text/style/BulletSpan\00", align 1
@.tmr.116 = private unnamed_addr constant [34 x i8] c"android/text/style/CharacterStyle\00", align 1
@.tmr.117 = private unnamed_addr constant [33 x i8] c"android/text/style/ClickableSpan\00", align 1
@.tmr.118 = private unnamed_addr constant [39 x i8] c"android/text/style/ForegroundColorSpan\00", align 1
@.tmr.119 = private unnamed_addr constant [34 x i8] c"android/text/style/LineHeightSpan\00", align 1
@.tmr.120 = private unnamed_addr constant [34 x i8] c"android/text/style/ParagraphStyle\00", align 1
@.tmr.121 = private unnamed_addr constant [36 x i8] c"android/text/style/WrapTogetherSpan\00", align 1
@.tmr.122 = private unnamed_addr constant [39 x i8] c"android/text/style/MetricAffectingSpan\00", align 1
@.tmr.123 = private unnamed_addr constant [37 x i8] c"android/text/style/StrikethroughSpan\00", align 1
@.tmr.124 = private unnamed_addr constant [29 x i8] c"android/text/style/StyleSpan\00", align 1
@.tmr.125 = private unnamed_addr constant [33 x i8] c"android/text/style/SubscriptSpan\00", align 1
@.tmr.126 = private unnamed_addr constant [35 x i8] c"android/text/style/SuperscriptSpan\00", align 1
@.tmr.127 = private unnamed_addr constant [32 x i8] c"android/text/style/TypefaceSpan\00", align 1
@.tmr.128 = private unnamed_addr constant [33 x i8] c"android/text/style/UnderlineSpan\00", align 1
@.tmr.129 = private unnamed_addr constant [36 x i8] c"android/text/method/BaseKeyListener\00", align 1
@.tmr.130 = private unnamed_addr constant [38 x i8] c"android/text/method/DigitsKeyListener\00", align 1
@.tmr.131 = private unnamed_addr constant [32 x i8] c"android/text/method/KeyListener\00", align 1
@.tmr.132 = private unnamed_addr constant [35 x i8] c"android/text/method/MovementMethod\00", align 1
@.tmr.133 = private unnamed_addr constant [39 x i8] c"android/text/method/MetaKeyKeyListener\00", align 1
@.tmr.134 = private unnamed_addr constant [38 x i8] c"android/text/method/NumberKeyListener\00", align 1
@.tmr.135 = private unnamed_addr constant [31 x i8] c"android/text/format/DateFormat\00", align 1
@.tmr.136 = private unnamed_addr constant [35 x i8] c"android/security/KeyStoreException\00", align 1
@.tmr.137 = private unnamed_addr constant [46 x i8] c"android/security/keystore/KeyGenParameterSpec\00", align 1
@.tmr.138 = private unnamed_addr constant [37 x i8] c"android/preference/PreferenceManager\00", align 1
@.tmr.139 = private unnamed_addr constant [22 x i8] c"android/opengl/Matrix\00", align 1
@.tmr.140 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 1
@.tmr.141 = private unnamed_addr constant [19 x i8] c"android/os/Message\00", align 1
@.tmr.142 = private unnamed_addr constant [24 x i8] c"android/os/PowerManager\00", align 1
@.tmr.143 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 1
@.tmr.144 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 1
@.tmr.145 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 1
@.tmr.146 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 1
@.tmr.147 = private unnamed_addr constant [30 x i8] c"android/os/CancellationSignal\00", align 1
@.tmr.148 = private unnamed_addr constant [23 x i8] c"android/os/Environment\00", align 1
@.tmr.149 = private unnamed_addr constant [34 x i8] c"android/os/IBinder$DeathRecipient\00", align 1
@.tmr.150 = private unnamed_addr constant [19 x i8] c"android/os/IBinder\00", align 1
@.tmr.151 = private unnamed_addr constant [45 x i8] c"android/os/IBinder$FrozenStateChangeCallback\00", align 1
@.tmr.152 = private unnamed_addr constant [22 x i8] c"android/os/IInterface\00", align 1
@.tmr.153 = private unnamed_addr constant [30 x i8] c"android/os/Parcelable$Creator\00", align 1
@.tmr.154 = private unnamed_addr constant [22 x i8] c"android/os/Parcelable\00", align 1
@.tmr.155 = private unnamed_addr constant [22 x i8] c"android/os/LocaleList\00", align 1
@.tmr.156 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 1
@.tmr.157 = private unnamed_addr constant [18 x i8] c"android/os/Parcel\00", align 1
@.tmr.158 = private unnamed_addr constant [27 x i8] c"android/animation/Animator\00", align 1
@.tmr.159 = private unnamed_addr constant [44 x i8] c"android/animation/Animator$AnimatorListener\00", align 1
@.tmr.160 = private unnamed_addr constant [47 x i8] c"mono/android/animation/AnimatorEventDispatcher\00", align 1
@.tmr.161 = private unnamed_addr constant [32 x i8] c"android/animation/ValueAnimator\00", align 1
@.tmr.162 = private unnamed_addr constant [55 x i8] c"android/animation/ValueAnimator$AnimatorUpdateListener\00", align 1
@.tmr.163 = private unnamed_addr constant [71 x i8] c"mono/android/animation/ValueAnimator_AnimatorUpdateListenerImplementor\00", align 1
@.tmr.164 = private unnamed_addr constant [60 x i8] c"android/animation/ValueAnimator$DurationScaleChangeListener\00", align 1
@.tmr.165 = private unnamed_addr constant [42 x i8] c"android/animation/AnimatorListenerAdapter\00", align 1
@.tmr.166 = private unnamed_addr constant [35 x i8] c"android/animation/TimeInterpolator\00", align 1
@.tmr.167 = private unnamed_addr constant [40 x i8] c"android/view/WindowManager$LayoutParams\00", align 1
@.tmr.168 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 1
@.tmr.169 = private unnamed_addr constant [40 x i8] c"android/view/View$AccessibilityDelegate\00", align 1
@.tmr.170 = private unnamed_addr constant [36 x i8] c"android/view/View$DragShadowBuilder\00", align 1
@.tmr.171 = private unnamed_addr constant [30 x i8] c"android/view/View$MeasureSpec\00", align 1
@.tmr.172 = private unnamed_addr constant [46 x i8] c"android/view/View$OnAttachStateChangeListener\00", align 1
@.tmr.173 = private unnamed_addr constant [62 x i8] c"mono/android/view/View_OnAttachStateChangeListenerImplementor\00", align 1
@.tmr.174 = private unnamed_addr constant [34 x i8] c"android/view/View$OnClickListener\00", align 1
@.tmr.175 = private unnamed_addr constant [50 x i8] c"mono/android/view/View_OnClickListenerImplementor\00", align 1
@.tmr.176 = private unnamed_addr constant [33 x i8] c"android/view/View$OnDragListener\00", align 1
@.tmr.177 = private unnamed_addr constant [40 x i8] c"android/view/View$OnFocusChangeListener\00", align 1
@.tmr.178 = private unnamed_addr constant [56 x i8] c"mono/android/view/View_OnFocusChangeListenerImplementor\00", align 1
@.tmr.179 = private unnamed_addr constant [34 x i8] c"android/view/View$OnHoverListener\00", align 1
@.tmr.180 = private unnamed_addr constant [32 x i8] c"android/view/View$OnKeyListener\00", align 1
@.tmr.181 = private unnamed_addr constant [48 x i8] c"mono/android/view/View_OnKeyListenerImplementor\00", align 1
@.tmr.182 = private unnamed_addr constant [41 x i8] c"android/view/View$OnLayoutChangeListener\00", align 1
@.tmr.183 = private unnamed_addr constant [57 x i8] c"mono/android/view/View_OnLayoutChangeListenerImplementor\00", align 1
@.tmr.184 = private unnamed_addr constant [41 x i8] c"android/view/View$OnScrollChangeListener\00", align 1
@.tmr.185 = private unnamed_addr constant [57 x i8] c"mono/android/view/View_OnScrollChangeListenerImplementor\00", align 1
@.tmr.186 = private unnamed_addr constant [34 x i8] c"android/view/View$OnTouchListener\00", align 1
@.tmr.187 = private unnamed_addr constant [50 x i8] c"mono/android/view/View_OnTouchListenerImplementor\00", align 1
@.tmr.188 = private unnamed_addr constant [22 x i8] c"android/view/KeyEvent\00", align 1
@.tmr.189 = private unnamed_addr constant [28 x i8] c"android/view/LayoutInflater\00", align 1
@.tmr.190 = private unnamed_addr constant [25 x i8] c"android/view/MotionEvent\00", align 1
@.tmr.191 = private unnamed_addr constant [30 x i8] c"android/view/ViewTreeObserver\00", align 1
@.tmr.192 = private unnamed_addr constant [53 x i8] c"android/view/ViewTreeObserver$OnGlobalLayoutListener\00", align 1
@.tmr.193 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 1
@.tmr.194 = private unnamed_addr constant [29 x i8] c"android/view/Window$Callback\00", align 1
@.tmr.195 = private unnamed_addr constant [24 x i8] c"android/view/ActionMode\00", align 1
@.tmr.196 = private unnamed_addr constant [33 x i8] c"android/view/ActionMode$Callback\00", align 1
@.tmr.197 = private unnamed_addr constant [28 x i8] c"android/view/ActionProvider\00", align 1
@.tmr.198 = private unnamed_addr constant [27 x i8] c"android/view/Choreographer\00", align 1
@.tmr.199 = private unnamed_addr constant [25 x i8] c"android/view/ContentInfo\00", align 1
@.tmr.200 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 1
@.tmr.201 = private unnamed_addr constant [21 x i8] c"android/view/Display\00", align 1
@.tmr.202 = private unnamed_addr constant [23 x i8] c"android/view/DragEvent\00", align 1
@.tmr.203 = private unnamed_addr constant [29 x i8] c"android/view/GestureDetector\00", align 1
@.tmr.204 = private unnamed_addr constant [49 x i8] c"android/view/GestureDetector$OnDoubleTapListener\00", align 1
@.tmr.205 = private unnamed_addr constant [47 x i8] c"android/view/GestureDetector$OnGestureListener\00", align 1
@.tmr.206 = private unnamed_addr constant [41 x i8] c"android/view/ContextMenu$ContextMenuInfo\00", align 1
@.tmr.207 = private unnamed_addr constant [25 x i8] c"android/view/ContextMenu\00", align 1
@.tmr.208 = private unnamed_addr constant [18 x i8] c"android/view/Menu\00", align 1
@.tmr.209 = private unnamed_addr constant [45 x i8] c"android/view/MenuItem$OnActionExpandListener\00", align 1
@.tmr.210 = private unnamed_addr constant [46 x i8] c"android/view/MenuItem$OnMenuItemClickListener\00", align 1
@.tmr.211 = private unnamed_addr constant [22 x i8] c"android/view/MenuItem\00", align 1
@.tmr.212 = private unnamed_addr constant [24 x i8] c"android/view/InputEvent\00", align 1
@.tmr.213 = private unnamed_addr constant [21 x i8] c"android/view/SubMenu\00", align 1
@.tmr.214 = private unnamed_addr constant [41 x i8] c"android/view/SurfaceControlInputReceiver\00", align 1
@.tmr.215 = private unnamed_addr constant [25 x i8] c"android/view/ViewManager\00", align 1
@.tmr.216 = private unnamed_addr constant [24 x i8] c"android/view/ViewParent\00", align 1
@.tmr.217 = private unnamed_addr constant [45 x i8] c"android/view/WindowInsetsAnimationController\00", align 1
@.tmr.218 = private unnamed_addr constant [50 x i8] c"android/view/WindowInsetsAnimationControlListener\00", align 1
@.tmr.219 = private unnamed_addr constant [36 x i8] c"android/view/WindowInsetsController\00", align 1
@.tmr.220 = private unnamed_addr constant [72 x i8] c"android/view/WindowInsetsController$OnControllableInsetsChangedListener\00", align 1
@.tmr.221 = private unnamed_addr constant [27 x i8] c"android/view/WindowManager\00", align 1
@.tmr.222 = private unnamed_addr constant [35 x i8] c"android/view/KeyboardShortcutGroup\00", align 1
@.tmr.223 = private unnamed_addr constant [34 x i8] c"android/view/KeyboardShortcutInfo\00", align 1
@.tmr.224 = private unnamed_addr constant [26 x i8] c"android/view/MenuInflater\00", align 1
@.tmr.225 = private unnamed_addr constant [38 x i8] c"android/view/OrientationEventListener\00", align 1
@.tmr.226 = private unnamed_addr constant [34 x i8] c"android/view/ScaleGestureDetector\00", align 1
@.tmr.227 = private unnamed_addr constant [57 x i8] c"android/view/ScaleGestureDetector$OnScaleGestureListener\00", align 1
@.tmr.228 = private unnamed_addr constant [63 x i8] c"android/view/ScaleGestureDetector$SimpleOnScaleGestureListener\00", align 1
@.tmr.229 = private unnamed_addr constant [25 x i8] c"android/view/SearchEvent\00", align 1
@.tmr.230 = private unnamed_addr constant [28 x i8] c"android/view/SurfaceControl\00", align 1
@.tmr.231 = private unnamed_addr constant [31 x i8] c"android/view/ViewConfiguration\00", align 1
@.tmr.232 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 1
@.tmr.233 = private unnamed_addr constant [36 x i8] c"android/view/ViewGroup$LayoutParams\00", align 1
@.tmr.234 = private unnamed_addr constant [42 x i8] c"android/view/ViewGroup$MarginLayoutParams\00", align 1
@.tmr.235 = private unnamed_addr constant [49 x i8] c"android/view/ViewGroup$OnHierarchyChangeListener\00", align 1
@.tmr.236 = private unnamed_addr constant [65 x i8] c"mono/android/view/ViewGroup_OnHierarchyChangeListenerImplementor\00", align 1
@.tmr.237 = private unnamed_addr constant [34 x i8] c"android/view/ViewPropertyAnimator\00", align 1
@.tmr.238 = private unnamed_addr constant [27 x i8] c"android/view/ViewStructure\00", align 1
@.tmr.239 = private unnamed_addr constant [26 x i8] c"android/view/WindowInsets\00", align 1
@.tmr.240 = private unnamed_addr constant [35 x i8] c"android/view/WindowInsetsAnimation\00", align 1
@.tmr.241 = private unnamed_addr constant [42 x i8] c"android/view/WindowInsetsAnimation$Bounds\00", align 1
@.tmr.242 = private unnamed_addr constant [27 x i8] c"android/view/WindowMetrics\00", align 1
@.tmr.243 = private unnamed_addr constant [50 x i8] c"android/view/contentcapture/ContentCaptureSession\00", align 1
@.tmr.244 = private unnamed_addr constant [33 x i8] c"android/view/autofill/AutofillId\00", align 1
@.tmr.245 = private unnamed_addr constant [33 x i8] c"android/view/animation/Animation\00", align 1
@.tmr.246 = private unnamed_addr constant [51 x i8] c"android/view/animation/Animation$AnimationListener\00", align 1
@.tmr.247 = private unnamed_addr constant [67 x i8] c"mono/android/view/animation/Animation_AnimationListenerImplementor\00", align 1
@.tmr.248 = private unnamed_addr constant [36 x i8] c"android/view/animation/AnimationSet\00", align 1
@.tmr.249 = private unnamed_addr constant [38 x i8] c"android/view/animation/AnimationUtils\00", align 1
@.tmr.250 = private unnamed_addr constant [40 x i8] c"android/view/animation/BaseInterpolator\00", align 1
@.tmr.251 = private unnamed_addr constant [46 x i8] c"android/view/animation/DecelerateInterpolator\00", align 1
@.tmr.252 = private unnamed_addr constant [36 x i8] c"android/view/animation/Interpolator\00", align 1
@.tmr.253 = private unnamed_addr constant [42 x i8] c"android/view/animation/LinearInterpolator\00", align 1
@.tmr.254 = private unnamed_addr constant [44 x i8] c"android/view/inputmethod/InputMethodManager\00", align 1
@.tmr.255 = private unnamed_addr constant [46 x i8] c"android/view/accessibility/AccessibilityEvent\00", align 1
@.tmr.256 = private unnamed_addr constant [49 x i8] c"android/view/accessibility/AccessibilityNodeInfo\00", align 1
@.tmr.257 = private unnamed_addr constant [68 x i8] c"android/view/accessibility/AccessibilityNodeInfo$ExtraRenderingInfo\00", align 1
@.tmr.258 = private unnamed_addr constant [47 x i8] c"android/view/accessibility/AccessibilityRecord\00", align 1
@.tmr.259 = private unnamed_addr constant [51 x i8] c"android/view/accessibility/AccessibilityWindowInfo\00", align 1
@.tmr.260 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 1
@.tmr.261 = private unnamed_addr constant [31 x i8] c"mono/android/runtime/JavaArray\00", align 1
@.tmr.262 = private unnamed_addr constant [21 x i8] c"java/util/Collection\00", align 1
@.tmr.263 = private unnamed_addr constant [18 x i8] c"java/util/HashMap\00", align 1
@.tmr.264 = private unnamed_addr constant [20 x i8] c"java/util/ArrayList\00", align 1
@.tmr.265 = private unnamed_addr constant [32 x i8] c"mono/android/runtime/JavaObject\00", align 1
@.tmr.266 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 1
@.tmr.267 = private unnamed_addr constant [18 x i8] c"java/util/HashSet\00", align 1
@.tmr.268 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 1
@.tmr.269 = private unnamed_addr constant [36 x i8] c"android/runtime/XmlReaderPullParser\00", align 1
@.tmr.270 = private unnamed_addr constant [16 x i8] c"android/net/Uri\00", align 1
@.tmr.271 = private unnamed_addr constant [24 x i8] c"android/graphics/Bitmap\00", align 1
@.tmr.272 = private unnamed_addr constant [39 x i8] c"android/graphics/Bitmap$CompressFormat\00", align 1
@.tmr.273 = private unnamed_addr constant [31 x i8] c"android/graphics/Bitmap$Config\00", align 1
@.tmr.274 = private unnamed_addr constant [24 x i8] c"android/graphics/Canvas\00", align 1
@.tmr.275 = private unnamed_addr constant [31 x i8] c"android/graphics/BitmapFactory\00", align 1
@.tmr.276 = private unnamed_addr constant [30 x i8] c"android/graphics/BitmapShader\00", align 1
@.tmr.277 = private unnamed_addr constant [27 x i8] c"android/graphics/BlendMode\00", align 1
@.tmr.278 = private unnamed_addr constant [32 x i8] c"android/graphics/BlurMaskFilter\00", align 1
@.tmr.279 = private unnamed_addr constant [37 x i8] c"android/graphics/BlurMaskFilter$Blur\00", align 1
@.tmr.280 = private unnamed_addr constant [29 x i8] c"android/graphics/ColorFilter\00", align 1
@.tmr.281 = private unnamed_addr constant [23 x i8] c"android/graphics/Color\00", align 1
@.tmr.282 = private unnamed_addr constant [32 x i8] c"android/graphics/DashPathEffect\00", align 1
@.tmr.283 = private unnamed_addr constant [24 x i8] c"android/graphics/Insets\00", align 1
@.tmr.284 = private unnamed_addr constant [32 x i8] c"android/graphics/LinearGradient\00", align 1
@.tmr.285 = private unnamed_addr constant [28 x i8] c"android/graphics/MaskFilter\00", align 1
@.tmr.286 = private unnamed_addr constant [24 x i8] c"android/graphics/Matrix\00", align 1
@.tmr.287 = private unnamed_addr constant [23 x i8] c"android/graphics/Paint\00", align 1
@.tmr.288 = private unnamed_addr constant [27 x i8] c"android/graphics/Paint$Cap\00", align 1
@.tmr.289 = private unnamed_addr constant [35 x i8] c"android/graphics/Paint$FontMetrics\00", align 1
@.tmr.290 = private unnamed_addr constant [38 x i8] c"android/graphics/Paint$FontMetricsInt\00", align 1
@.tmr.291 = private unnamed_addr constant [28 x i8] c"android/graphics/Paint$Join\00", align 1
@.tmr.292 = private unnamed_addr constant [29 x i8] c"android/graphics/Paint$Style\00", align 1
@.tmr.293 = private unnamed_addr constant [22 x i8] c"android/graphics/Path\00", align 1
@.tmr.294 = private unnamed_addr constant [32 x i8] c"android/graphics/Path$Direction\00", align 1
@.tmr.295 = private unnamed_addr constant [31 x i8] c"android/graphics/Path$FillType\00", align 1
@.tmr.296 = private unnamed_addr constant [25 x i8] c"android/graphics/Path$Op\00", align 1
@.tmr.297 = private unnamed_addr constant [28 x i8] c"android/graphics/PathEffect\00", align 1
@.tmr.298 = private unnamed_addr constant [23 x i8] c"android/graphics/Point\00", align 1
@.tmr.299 = private unnamed_addr constant [24 x i8] c"android/graphics/PointF\00", align 1
@.tmr.300 = private unnamed_addr constant [28 x i8] c"android/graphics/PorterDuff\00", align 1
@.tmr.301 = private unnamed_addr constant [33 x i8] c"android/graphics/PorterDuff$Mode\00", align 1
@.tmr.302 = private unnamed_addr constant [36 x i8] c"android/graphics/PorterDuffXfermode\00", align 1
@.tmr.303 = private unnamed_addr constant [32 x i8] c"android/graphics/RadialGradient\00", align 1
@.tmr.304 = private unnamed_addr constant [22 x i8] c"android/graphics/Rect\00", align 1
@.tmr.305 = private unnamed_addr constant [23 x i8] c"android/graphics/RectF\00", align 1
@.tmr.306 = private unnamed_addr constant [24 x i8] c"android/graphics/Region\00", align 1
@.tmr.307 = private unnamed_addr constant [27 x i8] c"android/graphics/Region$Op\00", align 1
@.tmr.308 = private unnamed_addr constant [24 x i8] c"android/graphics/Shader\00", align 1
@.tmr.309 = private unnamed_addr constant [33 x i8] c"android/graphics/Shader$TileMode\00", align 1
@.tmr.310 = private unnamed_addr constant [26 x i8] c"android/graphics/Typeface\00", align 1
@.tmr.311 = private unnamed_addr constant [26 x i8] c"android/graphics/Xfermode\00", align 1
@.tmr.312 = private unnamed_addr constant [35 x i8] c"android/graphics/drawable/Drawable\00", align 1
@.tmr.313 = private unnamed_addr constant [49 x i8] c"android/graphics/drawable/Drawable$ConstantState\00", align 1
@.tmr.314 = private unnamed_addr constant [44 x i8] c"android/graphics/drawable/DrawableContainer\00", align 1
@.tmr.315 = private unnamed_addr constant [40 x i8] c"android/graphics/drawable/InsetDrawable\00", align 1
@.tmr.316 = private unnamed_addr constant [40 x i8] c"android/graphics/drawable/LayerDrawable\00", align 1
@.tmr.317 = private unnamed_addr constant [44 x i8] c"android/graphics/drawable/AnimationDrawable\00", align 1
@.tmr.318 = private unnamed_addr constant [40 x i8] c"android/graphics/drawable/ColorDrawable\00", align 1
@.tmr.319 = private unnamed_addr constant [42 x i8] c"android/graphics/drawable/DrawableWrapper\00", align 1
@.tmr.320 = private unnamed_addr constant [43 x i8] c"android/graphics/drawable/GradientDrawable\00", align 1
@.tmr.321 = private unnamed_addr constant [55 x i8] c"android/graphics/drawable/GradientDrawable$Orientation\00", align 1
@.tmr.322 = private unnamed_addr constant [37 x i8] c"android/graphics/drawable/Animatable\00", align 1
@.tmr.323 = private unnamed_addr constant [31 x i8] c"android/graphics/drawable/Icon\00", align 1
@.tmr.324 = private unnamed_addr constant [40 x i8] c"android/graphics/drawable/PaintDrawable\00", align 1
@.tmr.325 = private unnamed_addr constant [41 x i8] c"android/graphics/drawable/RippleDrawable\00", align 1
@.tmr.326 = private unnamed_addr constant [40 x i8] c"android/graphics/drawable/ShapeDrawable\00", align 1
@.tmr.327 = private unnamed_addr constant [54 x i8] c"android/graphics/drawable/ShapeDrawable$ShaderFactory\00", align 1
@.tmr.328 = private unnamed_addr constant [44 x i8] c"android/graphics/drawable/StateListDrawable\00", align 1
@.tmr.329 = private unnamed_addr constant [43 x i8] c"android/graphics/drawable/shapes/OvalShape\00", align 1
@.tmr.330 = private unnamed_addr constant [43 x i8] c"android/graphics/drawable/shapes/RectShape\00", align 1
@.tmr.331 = private unnamed_addr constant [39 x i8] c"android/graphics/drawable/shapes/Shape\00", align 1
@.tmr.332 = private unnamed_addr constant [32 x i8] c"android/content/ContentProvider\00", align 1
@.tmr.333 = private unnamed_addr constant [30 x i8] c"android/content/ContentValues\00", align 1
@.tmr.334 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 1
@.tmr.335 = private unnamed_addr constant [23 x i8] c"android/content/Intent\00", align 1
@.tmr.336 = private unnamed_addr constant [34 x i8] c"android/content/BroadcastReceiver\00", align 1
@.tmr.337 = private unnamed_addr constant [25 x i8] c"android/content/ClipData\00", align 1
@.tmr.338 = private unnamed_addr constant [30 x i8] c"android/content/ClipData$Item\00", align 1
@.tmr.339 = private unnamed_addr constant [32 x i8] c"android/content/ClipDescription\00", align 1
@.tmr.340 = private unnamed_addr constant [30 x i8] c"android/content/ComponentName\00", align 1
@.tmr.341 = private unnamed_addr constant [32 x i8] c"android/content/ContentResolver\00", align 1
@.tmr.342 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 1
@.tmr.343 = private unnamed_addr constant [49 x i8] c"android/content/DialogInterface$OnCancelListener\00", align 1
@.tmr.344 = private unnamed_addr constant [65 x i8] c"mono/android/content/DialogInterface_OnCancelListenerImplementor\00", align 1
@.tmr.345 = private unnamed_addr constant [48 x i8] c"android/content/DialogInterface$OnClickListener\00", align 1
@.tmr.346 = private unnamed_addr constant [64 x i8] c"mono/android/content/DialogInterface_OnClickListenerImplementor\00", align 1
@.tmr.347 = private unnamed_addr constant [50 x i8] c"android/content/DialogInterface$OnDismissListener\00", align 1
@.tmr.348 = private unnamed_addr constant [66 x i8] c"mono/android/content/DialogInterface_OnDismissListenerImplementor\00", align 1
@.tmr.349 = private unnamed_addr constant [46 x i8] c"android/content/DialogInterface$OnKeyListener\00", align 1
@.tmr.350 = private unnamed_addr constant [59 x i8] c"android/content/DialogInterface$OnMultiChoiceClickListener\00", align 1
@.tmr.351 = private unnamed_addr constant [47 x i8] c"android/content/DialogInterface$OnShowListener\00", align 1
@.tmr.352 = private unnamed_addr constant [63 x i8] c"mono/android/content/DialogInterface_OnShowListenerImplementor\00", align 1
@.tmr.353 = private unnamed_addr constant [32 x i8] c"android/content/DialogInterface\00", align 1
@.tmr.354 = private unnamed_addr constant [29 x i8] c"android/content/IntentFilter\00", align 1
@.tmr.355 = private unnamed_addr constant [29 x i8] c"android/content/IntentSender\00", align 1
@.tmr.356 = private unnamed_addr constant [41 x i8] c"android/content/SharedPreferences$Editor\00", align 1
@.tmr.357 = private unnamed_addr constant [67 x i8] c"android/content/SharedPreferences$OnSharedPreferenceChangeListener\00", align 1
@.tmr.358 = private unnamed_addr constant [34 x i8] c"android/content/SharedPreferences\00", align 1
@.tmr.359 = private unnamed_addr constant [33 x i8] c"android/content/res/AssetManager\00", align 1
@.tmr.360 = private unnamed_addr constant [35 x i8] c"android/content/res/ColorStateList\00", align 1
@.tmr.361 = private unnamed_addr constant [34 x i8] c"android/content/res/Configuration\00", align 1
@.tmr.362 = private unnamed_addr constant [30 x i8] c"android/content/res/Resources\00", align 1
@.tmr.363 = private unnamed_addr constant [36 x i8] c"android/content/res/Resources$Theme\00", align 1
@.tmr.364 = private unnamed_addr constant [31 x i8] c"android/content/res/TypedArray\00", align 1
@.tmr.365 = private unnamed_addr constant [34 x i8] c"android/content/pm/PackageManager\00", align 1
@.tmr.366 = private unnamed_addr constant [35 x i8] c"android/content/pm/ApplicationInfo\00", align 1
@.tmr.367 = private unnamed_addr constant [31 x i8] c"android/content/pm/PackageInfo\00", align 1
@.tmr.368 = private unnamed_addr constant [35 x i8] c"android/content/pm/PackageItemInfo\00", align 1
@.tmr.369 = private unnamed_addr constant [32 x i8] c"android/content/pm/ShortcutInfo\00", align 1
@.tmr.370 = private unnamed_addr constant [40 x i8] c"android/content/pm/ShortcutInfo$Builder\00", align 1
@.tmr.371 = private unnamed_addr constant [35 x i8] c"android/content/pm/ShortcutManager\00", align 1
@.tmr.372 = private unnamed_addr constant [29 x i8] c"android/content/pm/Signature\00", align 1
@.tmr.373 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 1
@.tmr.374 = private unnamed_addr constant [24 x i8] c"android/app/AlertDialog\00", align 1
@.tmr.375 = private unnamed_addr constant [32 x i8] c"android/app/AlertDialog$Builder\00", align 1
@.tmr.376 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 1
@.tmr.377 = private unnamed_addr constant [51 x i8] c"android/app/Application$ActivityLifecycleCallbacks\00", align 1
@.tmr.378 = private unnamed_addr constant [29 x i8] c"android/app/DatePickerDialog\00", align 1
@.tmr.379 = private unnamed_addr constant [47 x i8] c"android/app/DatePickerDialog$OnDateSetListener\00", align 1
@.tmr.380 = private unnamed_addr constant [63 x i8] c"mono/android/app/DatePickerDialog_OnDateSetListenerImplementor\00", align 1
@.tmr.381 = private unnamed_addr constant [19 x i8] c"android/app/Dialog\00", align 1
@.tmr.382 = private unnamed_addr constant [29 x i8] c"android/app/TimePickerDialog\00", align 1
@.tmr.383 = private unnamed_addr constant [47 x i8] c"android/app/TimePickerDialog$OnTimeSetListener\00", align 1
@.tmr.384 = private unnamed_addr constant [63 x i8] c"mono/android/app/TimePickerDialog_OnTimeSetListenerImplementor\00", align 1
@.tmr.385 = private unnamed_addr constant [26 x i8] c"android/app/UiModeManager\00", align 1
@.tmr.386 = private unnamed_addr constant [26 x i8] c"android/app/PendingIntent\00", align 1
@.tmr.387 = private unnamed_addr constant [27 x i8] c"android/app/SearchableInfo\00", align 1
@.tmr.388 = private unnamed_addr constant [24 x i8] c"java/text/DecimalFormat\00", align 1
@.tmr.389 = private unnamed_addr constant [31 x i8] c"java/text/DecimalFormatSymbols\00", align 1
@.tmr.390 = private unnamed_addr constant [23 x i8] c"java/text/NumberFormat\00", align 1
@.tmr.391 = private unnamed_addr constant [17 x i8] c"java/text/Format\00", align 1
@.tmr.392 = private unnamed_addr constant [26 x i8] c"java/net/ConnectException\00", align 1
@.tmr.393 = private unnamed_addr constant [27 x i8] c"java/net/HttpURLConnection\00", align 1
@.tmr.394 = private unnamed_addr constant [27 x i8] c"java/net/InetSocketAddress\00", align 1
@.tmr.395 = private unnamed_addr constant [27 x i8] c"java/net/ProtocolException\00", align 1
@.tmr.396 = private unnamed_addr constant [15 x i8] c"java/net/Proxy\00", align 1
@.tmr.397 = private unnamed_addr constant [20 x i8] c"java/net/Proxy$Type\00", align 1
@.tmr.398 = private unnamed_addr constant [23 x i8] c"java/net/SocketAddress\00", align 1
@.tmr.399 = private unnamed_addr constant [25 x i8] c"java/net/SocketException\00", align 1
@.tmr.400 = private unnamed_addr constant [32 x i8] c"java/net/SocketTimeoutException\00", align 1
@.tmr.401 = private unnamed_addr constant [33 x i8] c"java/net/UnknownServiceException\00", align 1
@.tmr.402 = private unnamed_addr constant [13 x i8] c"java/net/URL\00", align 1
@.tmr.403 = private unnamed_addr constant [23 x i8] c"java/net/URLConnection\00", align 1
@.tmr.404 = private unnamed_addr constant [39 x i8] c"java/security/GeneralSecurityException\00", align 1
@.tmr.405 = private unnamed_addr constant [18 x i8] c"java/security/Key\00", align 1
@.tmr.406 = private unnamed_addr constant [24 x i8] c"java/security/Principal\00", align 1
@.tmr.407 = private unnamed_addr constant [25 x i8] c"java/security/PrivateKey\00", align 1
@.tmr.408 = private unnamed_addr constant [25 x i8] c"java/security/KeyFactory\00", align 1
@.tmr.409 = private unnamed_addr constant [23 x i8] c"java/security/KeyStore\00", align 1
@.tmr.410 = private unnamed_addr constant [32 x i8] c"java/security/KeyStoreException\00", align 1
@.tmr.411 = private unnamed_addr constant [27 x i8] c"java/security/SecureRandom\00", align 1
@.tmr.412 = private unnamed_addr constant [34 x i8] c"java/security/spec/EncodedKeySpec\00", align 1
@.tmr.413 = private unnamed_addr constant [27 x i8] c"java/security/spec/KeySpec\00", align 1
@.tmr.414 = private unnamed_addr constant [39 x i8] c"java/security/spec/PKCS8EncodedKeySpec\00", align 1
@.tmr.415 = private unnamed_addr constant [31 x i8] c"java/security/cert/Certificate\00", align 1
@.tmr.416 = private unnamed_addr constant [16 x i8] c"java/nio/Buffer\00", align 1
@.tmr.417 = private unnamed_addr constant [20 x i8] c"java/nio/ByteBuffer\00", align 1
@.tmr.418 = private unnamed_addr constant [25 x i8] c"java/nio/charset/Charset\00", align 1
@.tmr.419 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 1
@.tmr.420 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 1
@.tmr.421 = private unnamed_addr constant [13 x i8] c"java/io/File\00", align 1
@.tmr.422 = private unnamed_addr constant [23 x i8] c"java/io/FileDescriptor\00", align 1
@.tmr.423 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 1
@.tmr.424 = private unnamed_addr constant [30 x i8] c"java/io/FileNotFoundException\00", align 1
@.tmr.425 = private unnamed_addr constant [18 x i8] c"java/io/Closeable\00", align 1
@.tmr.426 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 1
@.tmr.427 = private unnamed_addr constant [31 x i8] c"java/io/InterruptedIOException\00", align 1
@.tmr.428 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 1
@.tmr.429 = private unnamed_addr constant [21 x i8] c"java/io/Serializable\00", align 1
@.tmr.430 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 1
@.tmr.431 = private unnamed_addr constant [20 x i8] c"java/io/PrintWriter\00", align 1
@.tmr.432 = private unnamed_addr constant [25 x i8] c"java/io/RandomAccessFile\00", align 1
@.tmr.433 = private unnamed_addr constant [15 x i8] c"java/io/Reader\00", align 1
@.tmr.434 = private unnamed_addr constant [15 x i8] c"java/io/Writer\00", align 1
@.tmr.435 = private unnamed_addr constant [15 x i8] c"java/util/List\00", align 1
@.tmr.436 = private unnamed_addr constant [21 x i8] c"java/util/Comparator\00", align 1
@.tmr.437 = private unnamed_addr constant [22 x i8] c"java/util/Enumeration\00", align 1
@.tmr.438 = private unnamed_addr constant [19 x i8] c"java/util/Iterator\00", align 1
@.tmr.439 = private unnamed_addr constant [23 x i8] c"java/util/ListIterator\00", align 1
@.tmr.440 = private unnamed_addr constant [23 x i8] c"java/util/RandomAccess\00", align 1
@.tmr.441 = private unnamed_addr constant [30 x i8] c"java/util/SequencedCollection\00", align 1
@.tmr.442 = private unnamed_addr constant [22 x i8] c"java/util/Spliterator\00", align 1
@.tmr.443 = private unnamed_addr constant [17 x i8] c"java/util/Locale\00", align 1
@.tmr.444 = private unnamed_addr constant [17 x i8] c"java/util/Random\00", align 1
@.tmr.445 = private unnamed_addr constant [28 x i8] c"java/util/function/Consumer\00", align 1
@.tmr.446 = private unnamed_addr constant [28 x i8] c"java/util/function/Function\00", align 1
@.tmr.447 = private unnamed_addr constant [31 x i8] c"java/util/function/IntConsumer\00", align 1
@.tmr.448 = private unnamed_addr constant [31 x i8] c"java/util/function/IntFunction\00", align 1
@.tmr.449 = private unnamed_addr constant [29 x i8] c"java/util/function/Predicate\00", align 1
@.tmr.450 = private unnamed_addr constant [36 x i8] c"java/util/function/ToDoubleFunction\00", align 1
@.tmr.451 = private unnamed_addr constant [33 x i8] c"java/util/function/ToIntFunction\00", align 1
@.tmr.452 = private unnamed_addr constant [34 x i8] c"java/util/function/ToLongFunction\00", align 1
@.tmr.453 = private unnamed_addr constant [33 x i8] c"java/util/function/UnaryOperator\00", align 1
@.tmr.454 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/Executor\00", align 1
@.tmr.455 = private unnamed_addr constant [28 x i8] c"java/util/concurrent/Future\00", align 1
@.tmr.456 = private unnamed_addr constant [34 x i8] c"java/util/concurrent/Future$State\00", align 1
@.tmr.457 = private unnamed_addr constant [30 x i8] c"java/util/concurrent/TimeUnit\00", align 1
@.tmr.458 = private unnamed_addr constant [18 x i8] c"java/lang/Boolean\00", align 1
@.tmr.459 = private unnamed_addr constant [15 x i8] c"java/lang/Byte\00", align 1
@.tmr.460 = private unnamed_addr constant [20 x i8] c"java/lang/Character\00", align 1
@.tmr.461 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 1
@.tmr.462 = private unnamed_addr constant [33 x i8] c"java/lang/ClassNotFoundException\00", align 1
@.tmr.463 = private unnamed_addr constant [17 x i8] c"java/lang/Double\00", align 1
@.tmr.464 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 1
@.tmr.465 = private unnamed_addr constant [16 x i8] c"java/lang/Float\00", align 1
@.tmr.466 = private unnamed_addr constant [23 x i8] c"java/lang/CharSequence\00", align 1
@.tmr.467 = private unnamed_addr constant [18 x i8] c"java/lang/Integer\00", align 1
@.tmr.468 = private unnamed_addr constant [15 x i8] c"java/lang/Long\00", align 1
@.tmr.469 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 1
@.tmr.470 = private unnamed_addr constant [24 x i8] c"mono/java/lang/Runnable\00", align 1
@.tmr.471 = private unnamed_addr constant [27 x i8] c"java/lang/RuntimeException\00", align 1
@.tmr.472 = private unnamed_addr constant [16 x i8] c"java/lang/Short\00", align 1
@.tmr.473 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 1
@.tmr.474 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 1
@.tmr.475 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 1
@.tmr.476 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 1
@.tmr.477 = private unnamed_addr constant [29 x i8] c"java/lang/ClassCastException\00", align 1
@.tmr.478 = private unnamed_addr constant [22 x i8] c"java/lang/ClassLoader\00", align 1
@.tmr.479 = private unnamed_addr constant [15 x i8] c"java/lang/Enum\00", align 1
@.tmr.480 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 1
@.tmr.481 = private unnamed_addr constant [21 x i8] c"java/lang/Appendable\00", align 1
@.tmr.482 = private unnamed_addr constant [24 x i8] c"java/lang/AutoCloseable\00", align 1
@.tmr.483 = private unnamed_addr constant [20 x i8] c"java/lang/Cloneable\00", align 1
@.tmr.484 = private unnamed_addr constant [19 x i8] c"java/lang/Iterable\00", align 1
@.tmr.485 = private unnamed_addr constant [35 x i8] c"java/lang/IllegalArgumentException\00", align 1
@.tmr.486 = private unnamed_addr constant [32 x i8] c"java/lang/IllegalStateException\00", align 1
@.tmr.487 = private unnamed_addr constant [36 x i8] c"java/lang/IndexOutOfBoundsException\00", align 1
@.tmr.488 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 1
@.tmr.489 = private unnamed_addr constant [23 x i8] c"java/lang/LinkageError\00", align 1
@.tmr.490 = private unnamed_addr constant [31 x i8] c"java/lang/NoClassDefFoundError\00", align 1
@.tmr.491 = private unnamed_addr constant [31 x i8] c"java/lang/NullPointerException\00", align 1
@.tmr.492 = private unnamed_addr constant [17 x i8] c"java/lang/Number\00", align 1
@.tmr.493 = private unnamed_addr constant [39 x i8] c"java/lang/ReflectiveOperationException\00", align 1
@.tmr.494 = private unnamed_addr constant [28 x i8] c"java/lang/SecurityException\00", align 1
@.tmr.495 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 1
@.tmr.496 = private unnamed_addr constant [40 x i8] c"java/lang/UnsupportedOperationException\00", align 1
@.tmr.497 = private unnamed_addr constant [15 x i8] c"java/lang/Void\00", align 1
@.tmr.498 = private unnamed_addr constant [32 x i8] c"java/lang/annotation/Annotation\00", align 1
@.tmr.499 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 1
@.tmr.500 = private unnamed_addr constant [34 x i8] c"androidx/activity/BackEventCompat\00", align 1
@.tmr.501 = private unnamed_addr constant [36 x i8] c"androidx/activity/ComponentActivity\00", align 1
@.tmr.502 = private unnamed_addr constant [34 x i8] c"androidx/activity/ComponentDialog\00", align 1
@.tmr.503 = private unnamed_addr constant [37 x i8] c"androidx/activity/FullyDrawnReporter\00", align 1
@.tmr.504 = private unnamed_addr constant [40 x i8] c"androidx/activity/OnBackPressedCallback\00", align 1
@.tmr.505 = private unnamed_addr constant [42 x i8] c"androidx/activity/OnBackPressedDispatcher\00", align 1
@.tmr.506 = private unnamed_addr constant [48 x i8] c"androidx/activity/result/ActivityResultLauncher\00", align 1
@.tmr.507 = private unnamed_addr constant [48 x i8] c"androidx/activity/result/ActivityResultRegistry\00", align 1
@.tmr.508 = private unnamed_addr constant [48 x i8] c"androidx/activity/result/ActivityResultCallback\00", align 1
@.tmr.509 = private unnamed_addr constant [48 x i8] c"androidx/activity/result/PickVisualMediaRequest\00", align 1
@.tmr.510 = private unnamed_addr constant [57 x i8] c"androidx/activity/result/contract/ActivityResultContract\00", align 1
@.tmr.511 = private unnamed_addr constant [75 x i8] c"androidx/activity/result/contract/ActivityResultContract$SynchronousResult\00", align 1
@.tmr.512 = private unnamed_addr constant [58 x i8] c"androidx/activity/result/contract/ActivityResultContracts\00", align 1
@.tmr.513 = private unnamed_addr constant [82 x i8] c"androidx/activity/result/contract/ActivityResultContracts$PickMultipleVisualMedia\00", align 1
@.tmr.514 = private unnamed_addr constant [74 x i8] c"androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia\00", align 1
@.tmr.515 = private unnamed_addr constant [85 x i8] c"androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$DefaultTab\00", align 1
@.tmr.516 = private unnamed_addr constant [90 x i8] c"androidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$VisualMediaType\00", align 1
@.tmr.517 = private unnamed_addr constant [58 x i8] c"androidx/activity/contextaware/OnContextAvailableListener\00", align 1
@.tmr.518 = private unnamed_addr constant [74 x i8] c"mono/androidx/activity/contextaware/OnContextAvailableListenerImplementor\00", align 1
@.tmr.519 = private unnamed_addr constant [50 x i8] c"com/google/android/material/shape/CornerTreatment\00", align 1
@.tmr.520 = private unnamed_addr constant [48 x i8] c"com/google/android/material/shape/EdgeTreatment\00", align 1
@.tmr.521 = private unnamed_addr constant [45 x i8] c"com/google/android/material/shape/CornerSize\00", align 1
@.tmr.522 = private unnamed_addr constant [56 x i8] c"com/google/android/material/shape/MaterialShapeDrawable\00", align 1
@.tmr.523 = private unnamed_addr constant [83 x i8] c"com/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState\00", align 1
@.tmr.524 = private unnamed_addr constant [55 x i8] c"com/google/android/material/shape/ShapeAppearanceModel\00", align 1
@.tmr.525 = private unnamed_addr constant [63 x i8] c"com/google/android/material/shape/ShapeAppearanceModel$Builder\00", align 1
@.tmr.526 = private unnamed_addr constant [79 x i8] c"com/google/android/material/shape/ShapeAppearanceModel$CornerSizeUnaryOperator\00", align 1
@.tmr.527 = private unnamed_addr constant [44 x i8] c"com/google/android/material/shape/ShapePath\00", align 1
@.tmr.528 = private unnamed_addr constant [49 x i8] c"com/google/android/material/shape/ShapePathModel\00", align 1
@.tmr.529 = private unnamed_addr constant [57 x i8] c"com/google/android/material/imageview/ShapeableImageView\00", align 1
@.tmr.530 = private unnamed_addr constant [63 x i8] c"com/google/android/material/elevation/ElevationOverlayProvider\00", align 1
@.tmr.531 = private unnamed_addr constant [62 x i8] c"com/google/android/material/dialog/MaterialAlertDialogBuilder\00", align 1
@.tmr.532 = private unnamed_addr constant [54 x i8] c"com/google/android/material/checkbox/MaterialCheckBox\00", align 1
@.tmr.533 = private unnamed_addr constant [84 x i8] c"com/google/android/material/checkbox/MaterialCheckBox$OnCheckedStateChangedListener\00", align 1
@.tmr.534 = private unnamed_addr constant [100 x i8] c"mono/com/google/android/material/checkbox/MaterialCheckBox_OnCheckedStateChangedListenerImplementor\00", align 1
@.tmr.535 = private unnamed_addr constant [77 x i8] c"com/google/android/material/checkbox/MaterialCheckBox$OnErrorChangedListener\00", align 1
@.tmr.536 = private unnamed_addr constant [93 x i8] c"mono/com/google/android/material/checkbox/MaterialCheckBox_OnErrorChangedListenerImplementor\00", align 1
@.tmr.537 = private unnamed_addr constant [50 x i8] c"com/google/android/material/button/MaterialButton\00", align 1
@.tmr.538 = private unnamed_addr constant [74 x i8] c"com/google/android/material/button/MaterialButton$OnCheckedChangeListener\00", align 1
@.tmr.539 = private unnamed_addr constant [90 x i8] c"mono/com/google/android/material/button/MaterialButton_OnCheckedChangeListenerImplementor\00", align 1
@.tmr.540 = private unnamed_addr constant [60 x i8] c"com/google/android/material/bottomsheet/BottomSheetBehavior\00", align 1
@.tmr.541 = private unnamed_addr constant [80 x i8] c"com/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback\00", align 1
@.tmr.542 = private unnamed_addr constant [58 x i8] c"com/google/android/material/bottomsheet/BottomSheetDialog\00", align 1
@.tmr.543 = private unnamed_addr constant [48 x i8] c"com/google/android/material/badge/BadgeDrawable\00", align 1
@.tmr.544 = private unnamed_addr constant [57 x i8] c"com/google/android/material/navigation/NavigationBarView\00", align 1
@.tmr.545 = private unnamed_addr constant [82 x i8] c"com/google/android/material/navigation/NavigationBarView$OnItemReselectedListener\00", align 1
@.tmr.546 = private unnamed_addr constant [98 x i8] c"mono/com/google/android/material/navigation/NavigationBarView_OnItemReselectedListenerImplementor\00", align 1
@.tmr.547 = private unnamed_addr constant [80 x i8] c"com/google/android/material/navigation/NavigationBarView$OnItemSelectedListener\00", align 1
@.tmr.548 = private unnamed_addr constant [96 x i8] c"mono/com/google/android/material/navigation/NavigationBarView_OnItemSelectedListenerImplementor\00", align 1
@.tmr.549 = private unnamed_addr constant [61 x i8] c"com/google/android/material/navigation/NavigationBarItemView\00", align 1
@.tmr.550 = private unnamed_addr constant [61 x i8] c"com/google/android/material/navigation/NavigationBarMenuView\00", align 1
@.tmr.551 = private unnamed_addr constant [62 x i8] c"com/google/android/material/navigation/NavigationBarPresenter\00", align 1
@.tmr.552 = private unnamed_addr constant [54 x i8] c"com/google/android/material/navigation/NavigationView\00", align 1
@.tmr.553 = private unnamed_addr constant [87 x i8] c"com/google/android/material/navigation/NavigationView$OnNavigationItemSelectedListener\00", align 1
@.tmr.554 = private unnamed_addr constant [103 x i8] c"mono/com/google/android/material/navigation/NavigationView_OnNavigationItemSelectedListenerImplementor\00", align 1
@.tmr.555 = private unnamed_addr constant [43 x i8] c"com/google/android/material/tabs/TabLayout\00", align 1
@.tmr.556 = private unnamed_addr constant [51 x i8] c"com/google/android/material/tabs/TabLayout$TabView\00", align 1
@.tmr.557 = private unnamed_addr constant [69 x i8] c"com/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener\00", align 1
@.tmr.558 = private unnamed_addr constant [85 x i8] c"mono/com/google/android/material/tabs/TabLayout_BaseOnTabSelectedListenerImplementor\00", align 1
@.tmr.559 = private unnamed_addr constant [65 x i8] c"com/google/android/material/tabs/TabLayout$OnTabSelectedListener\00", align 1
@.tmr.560 = private unnamed_addr constant [47 x i8] c"com/google/android/material/tabs/TabLayout$Tab\00", align 1
@.tmr.561 = private unnamed_addr constant [51 x i8] c"com/google/android/material/tabs/TabLayoutMediator\00", align 1
@.tmr.562 = private unnamed_addr constant [76 x i8] c"com/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy\00", align 1
@.tmr.563 = private unnamed_addr constant [67 x i8] c"com/google/android/material/internal/StaticLayoutBuilderConfigurer\00", align 1
@.tmr.564 = private unnamed_addr constant [60 x i8] c"com/google/android/material/internal/ScrimInsetsFrameLayout\00", align 1
@.tmr.565 = private unnamed_addr constant [70 x i8] c"com/google/android/material/bottomnavigation/BottomNavigationItemView\00", align 1
@.tmr.566 = private unnamed_addr constant [70 x i8] c"com/google/android/material/bottomnavigation/BottomNavigationMenuView\00", align 1
@.tmr.567 = private unnamed_addr constant [66 x i8] c"com/google/android/material/bottomnavigation/BottomNavigationView\00", align 1
@.tmr.568 = private unnamed_addr constant [101 x i8] c"com/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemReselectedListener\00", align 1
@.tmr.569 = private unnamed_addr constant [99 x i8] c"com/google/android/material/bottomnavigation/BottomNavigationView$OnNavigationItemSelectedListener\00", align 1
@.tmr.570 = private unnamed_addr constant [59 x i8] c"com/google/android/material/appbar/CollapsingToolbarLayout\00", align 1
@.tmr.571 = private unnamed_addr constant [89 x i8] c"com/google/android/material/appbar/CollapsingToolbarLayout$StaticLayoutBuilderConfigurer\00", align 1
@.tmr.572 = private unnamed_addr constant [48 x i8] c"com/google/android/material/appbar/AppBarLayout\00", align 1
@.tmr.573 = private unnamed_addr constant [61 x i8] c"com/google/android/material/appbar/AppBarLayout$BaseBehavior\00", align 1
@.tmr.574 = private unnamed_addr constant [78 x i8] c"com/google/android/material/appbar/AppBarLayout$BaseBehavior$BaseDragCallback\00", align 1
@.tmr.575 = private unnamed_addr constant [57 x i8] c"com/google/android/material/appbar/AppBarLayout$Behavior\00", align 1
@.tmr.576 = private unnamed_addr constant [66 x i8] c"com/google/android/material/appbar/AppBarLayout$ChildScrollEffect\00", align 1
@.tmr.577 = private unnamed_addr constant [61 x i8] c"com/google/android/material/appbar/AppBarLayout$LayoutParams\00", align 1
@.tmr.578 = private unnamed_addr constant [69 x i8] c"com/google/android/material/appbar/AppBarLayout$LiftOnScrollListener\00", align 1
@.tmr.579 = private unnamed_addr constant [85 x i8] c"mono/com/google/android/material/appbar/AppBarLayout_LiftOnScrollListenerImplementor\00", align 1
@.tmr.580 = private unnamed_addr constant [72 x i8] c"com/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener\00", align 1
@.tmr.581 = private unnamed_addr constant [88 x i8] c"mono/com/google/android/material/appbar/AppBarLayout_OnOffsetChangedListenerImplementor\00", align 1
@.tmr.582 = private unnamed_addr constant [70 x i8] c"com/google/android/material/appbar/AppBarLayout$ScrollingViewBehavior\00", align 1
@.tmr.583 = private unnamed_addr constant [50 x i8] c"com/google/android/material/appbar/HeaderBehavior\00", align 1
@.tmr.584 = private unnamed_addr constant [63 x i8] c"com/google/android/material/appbar/HeaderScrollingViewBehavior\00", align 1
@.tmr.585 = private unnamed_addr constant [51 x i8] c"com/google/android/material/appbar/MaterialToolbar\00", align 1
@.tmr.586 = private unnamed_addr constant [54 x i8] c"com/google/android/material/appbar/ViewOffsetBehavior\00", align 1
@.tmr.587 = private unnamed_addr constant [47 x i8] c"androidx/navigation/fragment/FragmentNavigator\00", align 1
@.tmr.588 = private unnamed_addr constant [59 x i8] c"androidx/navigation/fragment/FragmentNavigator$Destination\00", align 1
@.tmr.589 = private unnamed_addr constant [45 x i8] c"androidx/navigation/fragment/NavHostFragment\00", align 1
@.tmr.590 = private unnamed_addr constant [28 x i8] c"androidx/core/util/Consumer\00", align 1
@.tmr.591 = private unnamed_addr constant [29 x i8] c"androidx/core/util/Predicate\00", align 1
@.tmr.592 = private unnamed_addr constant [24 x i8] c"androidx/core/util/Pair\00", align 1
@.tmr.593 = private unnamed_addr constant [34 x i8] c"androidx/core/os/LocaleListCompat\00", align 1
@.tmr.594 = private unnamed_addr constant [44 x i8] c"androidx/core/internal/view/SupportMenuItem\00", align 1
@.tmr.595 = private unnamed_addr constant [34 x i8] c"androidx/core/graphics/ColorUtils\00", align 1
@.tmr.596 = private unnamed_addr constant [30 x i8] c"androidx/core/graphics/Insets\00", align 1
@.tmr.597 = private unnamed_addr constant [47 x i8] c"androidx/core/graphics/drawable/DrawableCompat\00", align 1
@.tmr.598 = private unnamed_addr constant [36 x i8] c"androidx/core/content/ContextCompat\00", align 1
@.tmr.599 = private unnamed_addr constant [35 x i8] c"androidx/core/content/FileProvider\00", align 1
@.tmr.600 = private unnamed_addr constant [43 x i8] c"androidx/core/content/pm/PackageInfoCompat\00", align 1
@.tmr.601 = private unnamed_addr constant [40 x i8] c"androidx/core/app/ActivityOptionsCompat\00", align 1
@.tmr.602 = private unnamed_addr constant [36 x i8] c"androidx/core/app/ComponentActivity\00", align 1
@.tmr.603 = private unnamed_addr constant [46 x i8] c"androidx/core/app/ComponentActivity$ExtraData\00", align 1
@.tmr.604 = private unnamed_addr constant [40 x i8] c"androidx/core/app/SharedElementCallback\00", align 1
@.tmr.605 = private unnamed_addr constant [70 x i8] c"androidx/core/app/SharedElementCallback$OnSharedElementsReadyListener\00", align 1
@.tmr.606 = private unnamed_addr constant [35 x i8] c"androidx/core/app/TaskStackBuilder\00", align 1
@.tmr.607 = private unnamed_addr constant [38 x i8] c"androidx/core/widget/NestedScrollView\00", align 1
@.tmr.608 = private unnamed_addr constant [61 x i8] c"androidx/core/widget/NestedScrollView$OnScrollChangeListener\00", align 1
@.tmr.609 = private unnamed_addr constant [77 x i8] c"mono/androidx/core/widget/NestedScrollView_OnScrollChangeListenerImplementor\00", align 1
@.tmr.610 = private unnamed_addr constant [42 x i8] c"androidx/core/widget/CompoundButtonCompat\00", align 1
@.tmr.611 = private unnamed_addr constant [36 x i8] c"androidx/core/widget/TextViewCompat\00", align 1
@.tmr.612 = private unnamed_addr constant [47 x i8] c"androidx/core/view/AccessibilityDelegateCompat\00", align 1
@.tmr.613 = private unnamed_addr constant [34 x i8] c"androidx/core/view/ActionProvider\00", align 1
@.tmr.614 = private unnamed_addr constant [58 x i8] c"androidx/core/view/ActionProvider$SubUiVisibilityListener\00", align 1
@.tmr.615 = private unnamed_addr constant [74 x i8] c"mono/androidx/core/view/ActionProvider_SubUiVisibilityListenerImplementor\00", align 1
@.tmr.616 = private unnamed_addr constant [53 x i8] c"androidx/core/view/ActionProvider$VisibilityListener\00", align 1
@.tmr.617 = private unnamed_addr constant [69 x i8] c"mono/androidx/core/view/ActionProvider_VisibilityListenerImplementor\00", align 1
@.tmr.618 = private unnamed_addr constant [37 x i8] c"androidx/core/view/ContentInfoCompat\00", align 1
@.tmr.619 = private unnamed_addr constant [39 x i8] c"androidx/core/view/DisplayCutoutCompat\00", align 1
@.tmr.620 = private unnamed_addr constant [32 x i8] c"androidx/core/view/MenuProvider\00", align 1
@.tmr.621 = private unnamed_addr constant [47 x i8] c"androidx/core/view/OnApplyWindowInsetsListener\00", align 1
@.tmr.622 = private unnamed_addr constant [44 x i8] c"androidx/core/view/OnReceiveContentListener\00", align 1
@.tmr.623 = private unnamed_addr constant [33 x i8] c"androidx/core/view/ScrollingView\00", align 1
@.tmr.624 = private unnamed_addr constant [48 x i8] c"androidx/core/view/ViewPropertyAnimatorListener\00", align 1
@.tmr.625 = private unnamed_addr constant [54 x i8] c"androidx/core/view/ViewPropertyAnimatorUpdateListener\00", align 1
@.tmr.626 = private unnamed_addr constant [62 x i8] c"androidx/core/view/WindowInsetsAnimationControlListenerCompat\00", align 1
@.tmr.627 = private unnamed_addr constant [34 x i8] c"androidx/core/view/MenuItemCompat\00", align 1
@.tmr.628 = private unnamed_addr constant [57 x i8] c"androidx/core/view/MenuItemCompat$OnActionExpandListener\00", align 1
@.tmr.629 = private unnamed_addr constant [37 x i8] c"androidx/core/view/PointerIconCompat\00", align 1
@.tmr.630 = private unnamed_addr constant [46 x i8] c"androidx/core/view/ScaleGestureDetectorCompat\00", align 1
@.tmr.631 = private unnamed_addr constant [30 x i8] c"androidx/core/view/ViewCompat\00", align 1
@.tmr.632 = private unnamed_addr constant [64 x i8] c"androidx/core/view/ViewCompat$OnUnhandledKeyEventListenerCompat\00", align 1
@.tmr.633 = private unnamed_addr constant [35 x i8] c"androidx/core/view/ViewGroupCompat\00", align 1
@.tmr.634 = private unnamed_addr constant [46 x i8] c"androidx/core/view/ViewPropertyAnimatorCompat\00", align 1
@.tmr.635 = private unnamed_addr constant [39 x i8] c"androidx/core/view/ViewStructureCompat\00", align 1
@.tmr.636 = private unnamed_addr constant [32 x i8] c"androidx/core/view/WindowCompat\00", align 1
@.tmr.637 = private unnamed_addr constant [47 x i8] c"androidx/core/view/WindowInsetsAnimationCompat\00", align 1
@.tmr.638 = private unnamed_addr constant [60 x i8] c"androidx/core/view/WindowInsetsAnimationCompat$BoundsCompat\00", align 1
@.tmr.639 = private unnamed_addr constant [56 x i8] c"androidx/core/view/WindowInsetsAnimationCompat$Callback\00", align 1
@.tmr.640 = private unnamed_addr constant [57 x i8] c"androidx/core/view/WindowInsetsAnimationControllerCompat\00", align 1
@.tmr.641 = private unnamed_addr constant [38 x i8] c"androidx/core/view/WindowInsetsCompat\00", align 1
@.tmr.642 = private unnamed_addr constant [46 x i8] c"androidx/core/view/WindowInsetsCompat$Builder\00", align 1
@.tmr.643 = private unnamed_addr constant [43 x i8] c"androidx/core/view/WindowInsetsCompat$Type\00", align 1
@.tmr.644 = private unnamed_addr constant [48 x i8] c"androidx/core/view/WindowInsetsControllerCompat\00", align 1
@.tmr.645 = private unnamed_addr constant [84 x i8] c"androidx/core/view/WindowInsetsControllerCompat$OnControllableInsetsChangedListener\00", align 1
@.tmr.646 = private unnamed_addr constant [100 x i8] c"mono/androidx/core/view/WindowInsetsControllerCompat_OnControllableInsetsChangedListenerImplementor\00", align 1
@.tmr.647 = private unnamed_addr constant [62 x i8] c"androidx/core/view/contentcapture/ContentCaptureSessionCompat\00", align 1
@.tmr.648 = private unnamed_addr constant [45 x i8] c"androidx/core/view/autofill/AutofillIdCompat\00", align 1
@.tmr.649 = private unnamed_addr constant [61 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat\00", align 1
@.tmr.650 = private unnamed_addr constant [87 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat\00", align 1
@.tmr.651 = private unnamed_addr constant [82 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat\00", align 1
@.tmr.652 = private unnamed_addr constant [86 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat\00", align 1
@.tmr.653 = private unnamed_addr constant [77 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat\00", align 1
@.tmr.654 = private unnamed_addr constant [85 x i8] c"androidx/core/view/accessibility/AccessibilityNodeInfoCompat$TouchDelegateInfoCompat\00", align 1
@.tmr.655 = private unnamed_addr constant [65 x i8] c"androidx/core/view/accessibility/AccessibilityNodeProviderCompat\00", align 1
@.tmr.656 = private unnamed_addr constant [63 x i8] c"androidx/core/view/accessibility/AccessibilityWindowInfoCompat\00", align 1
@.tmr.657 = private unnamed_addr constant [75 x i8] c"androidx/core/view/accessibility/AccessibilityViewCommand$CommandArguments\00", align 1
@.tmr.658 = private unnamed_addr constant [58 x i8] c"androidx/core/view/accessibility/AccessibilityViewCommand\00", align 1
@.tmr.659 = private unnamed_addr constant [41 x i8] c"androidx/core/text/PrecomputedTextCompat\00", align 1
@.tmr.660 = private unnamed_addr constant [48 x i8] c"androidx/core/text/PrecomputedTextCompat$Params\00", align 1
@.tmr.661 = private unnamed_addr constant [34 x i8] c"androidx/navigation/NavDirections\00", align 1
@.tmr.662 = private unnamed_addr constant [30 x i8] c"androidx/navigation/NavAction\00", align 1
@.tmr.663 = private unnamed_addr constant [32 x i8] c"androidx/navigation/NavArgument\00", align 1
@.tmr.664 = private unnamed_addr constant [38 x i8] c"androidx/navigation/NavBackStackEntry\00", align 1
@.tmr.665 = private unnamed_addr constant [32 x i8] c"androidx/navigation/NavDeepLink\00", align 1
@.tmr.666 = private unnamed_addr constant [39 x i8] c"androidx/navigation/NavDeepLinkRequest\00", align 1
@.tmr.667 = private unnamed_addr constant [35 x i8] c"androidx/navigation/NavDestination\00", align 1
@.tmr.668 = private unnamed_addr constant [49 x i8] c"androidx/navigation/NavDestination$DeepLinkMatch\00", align 1
@.tmr.669 = private unnamed_addr constant [29 x i8] c"androidx/navigation/NavGraph\00", align 1
@.tmr.670 = private unnamed_addr constant [38 x i8] c"androidx/navigation/NavGraphNavigator\00", align 1
@.tmr.671 = private unnamed_addr constant [30 x i8] c"androidx/navigation/Navigator\00", align 1
@.tmr.672 = private unnamed_addr constant [37 x i8] c"androidx/navigation/Navigator$Extras\00", align 1
@.tmr.673 = private unnamed_addr constant [38 x i8] c"androidx/navigation/NavigatorProvider\00", align 1
@.tmr.674 = private unnamed_addr constant [35 x i8] c"androidx/navigation/NavigatorState\00", align 1
@.tmr.675 = private unnamed_addr constant [31 x i8] c"androidx/navigation/NavOptions\00", align 1
@.tmr.676 = private unnamed_addr constant [28 x i8] c"androidx/navigation/NavType\00", align 1
@.tmr.677 = private unnamed_addr constant [40 x i8] c"androidx/navigation/internal/NavContext\00", align 1
@.tmr.678 = private unnamed_addr constant [54 x i8] c"androidx/swiperefreshlayout/widget/SwipeRefreshLayout\00", align 1
@.tmr.679 = private unnamed_addr constant [78 x i8] c"androidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback\00", align 1
@.tmr.680 = private unnamed_addr constant [72 x i8] c"androidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener\00", align 1
@.tmr.681 = private unnamed_addr constant [88 x i8] c"mono/androidx/swiperefreshlayout/widget/SwipeRefreshLayout_OnRefreshListenerImplementor\00", align 1
@.tmr.682 = private unnamed_addr constant [43 x i8] c"androidx/navigation/ui/AppBarConfiguration\00", align 1
@.tmr.683 = private unnamed_addr constant [51 x i8] c"androidx/navigation/ui/AppBarConfiguration$Builder\00", align 1
@.tmr.684 = private unnamed_addr constant [64 x i8] c"androidx/navigation/ui/AppBarConfiguration$OnNavigateUpListener\00", align 1
@.tmr.685 = private unnamed_addr constant [36 x i8] c"androidx/navigation/ui/NavigationUI\00", align 1
@.tmr.686 = private unnamed_addr constant [43 x i8] c"crc643f2b18b2570eaa5a/PlatformGraphicsView\00", align 1
@.tmr.687 = private unnamed_addr constant [44 x i8] c"androidx/cursoradapter/widget/CursorAdapter\00", align 1
@.tmr.688 = private unnamed_addr constant [39 x i8] c"androidx/lifecycle/ViewModelStoreOwner\00", align 1
@.tmr.689 = private unnamed_addr constant [29 x i8] c"androidx/lifecycle/ViewModel\00", align 1
@.tmr.690 = private unnamed_addr constant [37 x i8] c"androidx/lifecycle/ViewModelProvider\00", align 1
@.tmr.691 = private unnamed_addr constant [55 x i8] c"androidx/lifecycle/ViewModelProvider$Factory$Companion\00", align 1
@.tmr.692 = private unnamed_addr constant [45 x i8] c"androidx/lifecycle/ViewModelProvider$Factory\00", align 1
@.tmr.693 = private unnamed_addr constant [34 x i8] c"androidx/lifecycle/ViewModelStore\00", align 1
@.tmr.694 = private unnamed_addr constant [44 x i8] c"androidx/lifecycle/viewmodel/CreationExtras\00", align 1
@.tmr.695 = private unnamed_addr constant [48 x i8] c"androidx/lifecycle/viewmodel/CreationExtras$Key\00", align 1
@.tmr.696 = private unnamed_addr constant [50 x i8] c"androidx/lifecycle/viewmodel/ViewModelInitializer\00", align 1
@.tmr.697 = private unnamed_addr constant [34 x i8] c"androidx/cardview/widget/CardView\00", align 1
@.tmr.698 = private unnamed_addr constant [48 x i8] c"crc6488302ad6e9e4df1a/ImageLoaderResultCallback\00", align 1
@.tmr.699 = private unnamed_addr constant [42 x i8] c"crc6488302ad6e9e4df1a/ImageLoaderCallback\00", align 1
@.tmr.700 = private unnamed_addr constant [48 x i8] c"crc6488302ad6e9e4df1a/ImageLoaderCallbackBase_1\00", align 1
@.tmr.701 = private unnamed_addr constant [44 x i8] c"crc6488302ad6e9e4df1a/MauiAppCompatActivity\00", align 1
@.tmr.702 = private unnamed_addr constant [67 x i8] c"crc6488302ad6e9e4df1a/MauiAppCompatActivity_PredictiveBackCallback\00", align 1
@.tmr.703 = private unnamed_addr constant [38 x i8] c"crc6488302ad6e9e4df1a/MauiApplication\00", align 1
@.tmr.704 = private unnamed_addr constant [65 x i8] c"crc6488302ad6e9e4df1a/MauiApplication_ActivityLifecycleCallbacks\00", align 1
@.tmr.705 = private unnamed_addr constant [45 x i8] c"com/microsoft/maui/HybridJavaScriptInterface\00", align 1
@.tmr.706 = private unnamed_addr constant [39 x i8] c"com/microsoft/maui/ImageLoaderCallback\00", align 1
@.tmr.707 = private unnamed_addr constant [42 x i8] c"com/microsoft/maui/PlatformShadowDrawable\00", align 1
@.tmr.708 = private unnamed_addr constant [33 x i8] c"com/microsoft/maui/MauiViewGroup\00", align 1
@.tmr.709 = private unnamed_addr constant [45 x i8] c"com/microsoft/maui/PlatformAppCompatTextView\00", align 1
@.tmr.710 = private unnamed_addr constant [44 x i8] c"com/microsoft/maui/PlatformContentViewGroup\00", align 1
@.tmr.711 = private unnamed_addr constant [38 x i8] c"com/microsoft/maui/PlatformDispatcher\00", align 1
@.tmr.712 = private unnamed_addr constant [36 x i8] c"com/microsoft/maui/PlatformFontSpan\00", align 1
@.tmr.713 = private unnamed_addr constant [35 x i8] c"com/microsoft/maui/PlatformInterop\00", align 1
@.tmr.714 = private unnamed_addr constant [42 x i8] c"com/microsoft/maui/PlatformLineHeightSpan\00", align 1
@.tmr.715 = private unnamed_addr constant [34 x i8] c"com/microsoft/maui/PlatformLogger\00", align 1
@.tmr.716 = private unnamed_addr constant [49 x i8] c"com/microsoft/maui/PlatformMauiAppCompatActivity\00", align 1
@.tmr.717 = private unnamed_addr constant [37 x i8] c"com/microsoft/maui/PlatformPaintType\00", align 1
@.tmr.718 = private unnamed_addr constant [37 x i8] c"com/microsoft/maui/PlatformViewGroup\00", align 1
@.tmr.719 = private unnamed_addr constant [39 x i8] c"com/microsoft/maui/PlatformWrapperView\00", align 1
@.tmr.720 = private unnamed_addr constant [57 x i8] c"crc6452ffdc5b34af3a0f/AccessibilityDelegateCompatWrapper\00", align 1
@.tmr.721 = private unnamed_addr constant [37 x i8] c"crc6452ffdc5b34af3a0f/BorderDrawable\00", align 1
@.tmr.722 = private unnamed_addr constant [36 x i8] c"crc6452ffdc5b34af3a0f/ContainerView\00", align 1
@.tmr.723 = private unnamed_addr constant [39 x i8] c"crc6452ffdc5b34af3a0f/ContentViewGroup\00", align 1
@.tmr.724 = private unnamed_addr constant [58 x i8] c"crc6452ffdc5b34af3a0f/FragmentManagerExtensions_CallBacks\00", align 1
@.tmr.725 = private unnamed_addr constant [38 x i8] c"crc6452ffdc5b34af3a0f/LayoutViewGroup\00", align 1
@.tmr.726 = private unnamed_addr constant [49 x i8] c"crc6452ffdc5b34af3a0f/LocalizedDigitsKeyListener\00", align 1
@.tmr.727 = private unnamed_addr constant [54 x i8] c"crc6452ffdc5b34af3a0f/MauiAccessibilityDelegateCompat\00", align 1
@.tmr.728 = private unnamed_addr constant [44 x i8] c"crc6452ffdc5b34af3a0f/MauiAppCompatEditText\00", align 1
@.tmr.729 = private unnamed_addr constant [34 x i8] c"crc6452ffdc5b34af3a0f/MauiBoxView\00", align 1
@.tmr.730 = private unnamed_addr constant [37 x i8] c"crc6452ffdc5b34af3a0f/MauiDatePicker\00", align 1
@.tmr.731 = private unnamed_addr constant [40 x i8] c"crc6452ffdc5b34af3a0f/MauiHybridWebView\00", align 1
@.tmr.732 = private unnamed_addr constant [46 x i8] c"crc6452ffdc5b34af3a0f/MauiHybridWebViewClient\00", align 1
@.tmr.733 = private unnamed_addr constant [40 x i8] c"crc6452ffdc5b34af3a0f/MauiLayerDrawable\00", align 1
@.tmr.734 = private unnamed_addr constant [41 x i8] c"crc6452ffdc5b34af3a0f/MauiMaterialButton\00", align 1
@.tmr.735 = private unnamed_addr constant [63 x i8] c"crc6452ffdc5b34af3a0f/MauiMaterialButton_MauiResizableDrawable\00", align 1
@.tmr.736 = private unnamed_addr constant [54 x i8] c"crc6452ffdc5b34af3a0f/MauiMaterialContextThemeWrapper\00", align 1
@.tmr.737 = private unnamed_addr constant [38 x i8] c"crc6452ffdc5b34af3a0f/MauiPageControl\00", align 1
@.tmr.738 = private unnamed_addr constant [57 x i8] c"crc6452ffdc5b34af3a0f/MauiPageControl_TEditClickListener\00", align 1
@.tmr.739 = private unnamed_addr constant [33 x i8] c"crc6452ffdc5b34af3a0f/MauiPicker\00", align 1
@.tmr.740 = private unnamed_addr constant [37 x i8] c"crc6452ffdc5b34af3a0f/MauiPickerBase\00", align 1
@.tmr.741 = private unnamed_addr constant [37 x i8] c"crc6452ffdc5b34af3a0f/MauiScrollView\00", align 1
@.tmr.742 = private unnamed_addr constant [47 x i8] c"crc6452ffdc5b34af3a0f/MauiHorizontalScrollView\00", align 1
@.tmr.743 = private unnamed_addr constant [37 x i8] c"crc6452ffdc5b34af3a0f/MauiSearchView\00", align 1
@.tmr.744 = private unnamed_addr constant [45 x i8] c"crc6452ffdc5b34af3a0f/MauiShapeableImageView\00", align 1
@.tmr.745 = private unnamed_addr constant [36 x i8] c"crc6452ffdc5b34af3a0f/MauiShapeView\00", align 1
@.tmr.746 = private unnamed_addr constant [34 x i8] c"crc6452ffdc5b34af3a0f/MauiStepper\00", align 1
@.tmr.747 = private unnamed_addr constant [45 x i8] c"crc6452ffdc5b34af3a0f/MauiSwipeRefreshLayout\00", align 1
@.tmr.748 = private unnamed_addr constant [36 x i8] c"crc6452ffdc5b34af3a0f/MauiSwipeView\00", align 1
@.tmr.749 = private unnamed_addr constant [35 x i8] c"crc6452ffdc5b34af3a0f/MauiTextView\00", align 1
@.tmr.750 = private unnamed_addr constant [37 x i8] c"crc6452ffdc5b34af3a0f/MauiTimePicker\00", align 1
@.tmr.751 = private unnamed_addr constant [42 x i8] c"crc6452ffdc5b34af3a0f/MauiWebChromeClient\00", align 1
@.tmr.752 = private unnamed_addr constant [34 x i8] c"crc6452ffdc5b34af3a0f/MauiWebView\00", align 1
@.tmr.753 = private unnamed_addr constant [40 x i8] c"crc6452ffdc5b34af3a0f/MauiWebViewClient\00", align 1
@.tmr.754 = private unnamed_addr constant [46 x i8] c"crc6452ffdc5b34af3a0f/MauiWindowInsetListener\00", align 1
@.tmr.755 = private unnamed_addr constant [44 x i8] c"microsoft/maui/platform/MauiNavHostFragment\00", align 1
@.tmr.756 = private unnamed_addr constant [65 x i8] c"crc6452ffdc5b34af3a0f/NavigationRootManager_ElementBasedFragment\00", align 1
@.tmr.757 = private unnamed_addr constant [45 x i8] c"crc6452ffdc5b34af3a0f/NavigationViewFragment\00", align 1
@.tmr.758 = private unnamed_addr constant [37 x i8] c"crc6452ffdc5b34af3a0f/ScopedFragment\00", align 1
@.tmr.759 = private unnamed_addr constant [55 x i8] c"crc6452ffdc5b34af3a0f/StackNavigationManager_Callbacks\00", align 1
@.tmr.760 = private unnamed_addr constant [35 x i8] c"crc6452ffdc5b34af3a0f/ViewFragment\00", align 1
@.tmr.761 = private unnamed_addr constant [48 x i8] c"crc6452ffdc5b34af3a0f/PlatformTouchGraphicsView\00", align 1
@.tmr.762 = private unnamed_addr constant [43 x i8] c"crc6452ffdc5b34af3a0f/StepperHandlerHolder\00", align 1
@.tmr.763 = private unnamed_addr constant [60 x i8] c"crc6452ffdc5b34af3a0f/StepperHandlerManager_StepperListener\00", align 1
@.tmr.764 = private unnamed_addr constant [37 x i8] c"crc6452ffdc5b34af3a0f/SwipeViewPager\00", align 1
@.tmr.765 = private unnamed_addr constant [57 x i8] c"crc6452ffdc5b34af3a0f/WebViewExtensions_JavascriptResult\00", align 1
@.tmr.766 = private unnamed_addr constant [34 x i8] c"crc6452ffdc5b34af3a0f/WrapperView\00", align 1
@.tmr.767 = private unnamed_addr constant [56 x i8] c"crc64fcf28c0e24b4cc31/ButtonHandler_ButtonClickListener\00", align 1
@.tmr.768 = private unnamed_addr constant [56 x i8] c"crc64fcf28c0e24b4cc31/ButtonHandler_ButtonTouchListener\00", align 1
@.tmr.769 = private unnamed_addr constant [76 x i8] c"crc64fcf28c0e24b4cc31/HybridWebViewHandler_HybridWebViewJavaScriptInterface\00", align 1
@.tmr.770 = private unnamed_addr constant [59 x i8] c"crc64fcf28c0e24b4cc31/SearchBarHandler_FocusChangeListener\00", align 1
@.tmr.771 = private unnamed_addr constant [58 x i8] c"crc64fcf28c0e24b4cc31/SliderHandler_SeekBarChangeListener\00", align 1
@.tmr.772 = private unnamed_addr constant [58 x i8] c"crc64fcf28c0e24b4cc31/SwitchHandler_CheckedChangeListener\00", align 1
@.tmr.773 = private unnamed_addr constant [54 x i8] c"crc64fcf28c0e24b4cc31/ToolbarHandler_ProcessBackClick\00", align 1
@.tmr.774 = private unnamed_addr constant [50 x i8] c"crc64b5e713d400f589b7/LinearGradientShaderFactory\00", align 1
@.tmr.775 = private unnamed_addr constant [50 x i8] c"crc64b5e713d400f589b7/RadialGradientShaderFactory\00", align 1
@.tmr.776 = private unnamed_addr constant [35 x i8] c"crc64b5e713d400f589b7/MauiDrawable\00", align 1
@.tmr.777 = private unnamed_addr constant [59 x i8] c"crc64a096dc44ad241142/PlatformTicker_DurationScaleListener\00", align 1
@.tmr.778 = private unnamed_addr constant [31 x i8] c"androidx/loader/content/Loader\00", align 1
@.tmr.779 = private unnamed_addr constant [54 x i8] c"androidx/loader/content/Loader$OnLoadCanceledListener\00", align 1
@.tmr.780 = private unnamed_addr constant [54 x i8] c"androidx/loader/content/Loader$OnLoadCompleteListener\00", align 1
@.tmr.781 = private unnamed_addr constant [34 x i8] c"androidx/loader/app/LoaderManager\00", align 1
@.tmr.782 = private unnamed_addr constant [50 x i8] c"androidx/loader/app/LoaderManager$LoaderCallbacks\00", align 1
@.tmr.783 = private unnamed_addr constant [28 x i8] c"androidx/lifecycle/Observer\00", align 1
@.tmr.784 = private unnamed_addr constant [28 x i8] c"androidx/lifecycle/LiveData\00", align 1
@.tmr.785 = private unnamed_addr constant [35 x i8] c"androidx/lifecycle/MutableLiveData\00", align 1
@.tmr.786 = private unnamed_addr constant [34 x i8] c"androidx/navigation/NavController\00", align 1
@.tmr.787 = private unnamed_addr constant [63 x i8] c"androidx/navigation/NavController$OnDestinationChangedListener\00", align 1
@.tmr.788 = private unnamed_addr constant [79 x i8] c"mono/androidx/navigation/NavController_OnDestinationChangedListenerImplementor\00", align 1
@.tmr.789 = private unnamed_addr constant [39 x i8] c"androidx/navigation/NavDeepLinkBuilder\00", align 1
@.tmr.790 = private unnamed_addr constant [38 x i8] c"androidx/navigation/NavHostController\00", align 1
@.tmr.791 = private unnamed_addr constant [32 x i8] c"androidx/navigation/NavInflater\00", align 1
@.tmr.792 = private unnamed_addr constant [36 x i8] c"androidx/customview/widget/Openable\00", align 1
@.tmr.793 = private unnamed_addr constant [48 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal\00", align 1
@.tmr.794 = private unnamed_addr constant [60 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal$BooleanList\00", align 1
@.tmr.795 = private unnamed_addr constant [59 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal$DoubleList\00", align 1
@.tmr.796 = private unnamed_addr constant [57 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal$EnumLite\00", align 1
@.tmr.797 = private unnamed_addr constant [60 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal$EnumLiteMap\00", align 1
@.tmr.798 = private unnamed_addr constant [58 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal$FloatList\00", align 1
@.tmr.799 = private unnamed_addr constant [56 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal$IntList\00", align 1
@.tmr.800 = private unnamed_addr constant [57 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal$LongList\00", align 1
@.tmr.801 = private unnamed_addr constant [61 x i8] c"com/google/crypto/tink/shaded/protobuf/Internal$ProtobufList\00", align 1
@.tmr.802 = private unnamed_addr constant [59 x i8] c"com/google/crypto/tink/shaded/protobuf/AbstractMessageLite\00", align 1
@.tmr.803 = private unnamed_addr constant [50 x i8] c"com/google/crypto/tink/shaded/protobuf/ByteOutput\00", align 1
@.tmr.804 = private unnamed_addr constant [50 x i8] c"com/google/crypto/tink/shaded/protobuf/ByteString\00", align 1
@.tmr.805 = private unnamed_addr constant [57 x i8] c"com/google/crypto/tink/shaded/protobuf/ByteString$Output\00", align 1
@.tmr.806 = private unnamed_addr constant [56 x i8] c"com/google/crypto/tink/shaded/protobuf/CodedInputStream\00", align 1
@.tmr.807 = private unnamed_addr constant [57 x i8] c"com/google/crypto/tink/shaded/protobuf/CodedOutputStream\00", align 1
@.tmr.808 = private unnamed_addr constant [53 x i8] c"com/google/crypto/tink/shaded/protobuf/ExtensionLite\00", align 1
@.tmr.809 = private unnamed_addr constant [61 x i8] c"com/google/crypto/tink/shaded/protobuf/ExtensionRegistryLite\00", align 1
@.tmr.810 = private unnamed_addr constant [60 x i8] c"com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite\00", align 1
@.tmr.811 = private unnamed_addr constant [79 x i8] c"com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$GeneratedExtension\00", align 1
@.tmr.812 = private unnamed_addr constant [75 x i8] c"com/google/crypto/tink/shaded/protobuf/GeneratedMessageLite$MethodToInvoke\00", align 1
@.tmr.813 = private unnamed_addr constant [59 x i8] c"com/google/crypto/tink/shaded/protobuf/MessageLite$Builder\00", align 1
@.tmr.814 = private unnamed_addr constant [51 x i8] c"com/google/crypto/tink/shaded/protobuf/MessageLite\00", align 1
@.tmr.815 = private unnamed_addr constant [60 x i8] c"com/google/crypto/tink/shaded/protobuf/MessageLiteOrBuilder\00", align 1
@.tmr.816 = private unnamed_addr constant [70 x i8] c"com/google/crypto/tink/shaded/protobuf/InvalidProtocolBufferException\00", align 1
@.tmr.817 = private unnamed_addr constant [46 x i8] c"com/google/crypto/tink/shaded/protobuf/Parser\00", align 1
@.tmr.818 = private unnamed_addr constant [53 x i8] c"com/google/crypto/tink/shaded/protobuf/LazyFieldLite\00", align 1
@.tmr.819 = private unnamed_addr constant [59 x i8] c"com/google/crypto/tink/shaded/protobuf/UnknownFieldSetLite\00", align 1
@.tmr.820 = private unnamed_addr constant [50 x i8] c"com/google/crypto/tink/shaded/protobuf/WireFormat\00", align 1
@.tmr.821 = private unnamed_addr constant [60 x i8] c"com/google/crypto/tink/shaded/protobuf/WireFormat$FieldType\00", align 1
@.tmr.822 = private unnamed_addr constant [59 x i8] c"com/google/crypto/tink/shaded/protobuf/WireFormat$JavaType\00", align 1
@.tmr.823 = private unnamed_addr constant [55 x i8] c"crc64f728827fec74e9c3/TapWindowTracker_GestureListener\00", align 1
@.tmr.824 = private unnamed_addr constant [40 x i8] c"crc64f728827fec74e9c3/Toolbar_Container\00", align 1
@.tmr.825 = private unnamed_addr constant [48 x i8] c"crc64338477404e88479c/ColorChangeRevealDrawable\00", align 1
@.tmr.826 = private unnamed_addr constant [52 x i8] c"crc64338477404e88479c/ControlsAccessibilityDelegate\00", align 1
@.tmr.827 = private unnamed_addr constant [48 x i8] c"crc64338477404e88479c/DragAndDropGestureHandler\00", align 1
@.tmr.828 = private unnamed_addr constant [69 x i8] c"crc64338477404e88479c/DragAndDropGestureHandler_CustomLocalStateData\00", align 1
@.tmr.829 = private unnamed_addr constant [66 x i8] c"crc64338477404e88479c/ToolbarExtensions_ToolbarTitleIconImageView\00", align 1
@.tmr.830 = private unnamed_addr constant [40 x i8] c"crc64338477404e88479c/FragmentContainer\00", align 1
@.tmr.831 = private unnamed_addr constant [46 x i8] c"crc64338477404e88479c/GenericAnimatorListener\00", align 1
@.tmr.832 = private unnamed_addr constant [50 x i8] c"crc64338477404e88479c/GenericGlobalLayoutListener\00", align 1
@.tmr.833 = private unnamed_addr constant [47 x i8] c"crc64338477404e88479c/GenericMenuClickListener\00", align 1
@.tmr.834 = private unnamed_addr constant [45 x i8] c"crc64338477404e88479c/GradientStrokeDrawable\00", align 1
@.tmr.835 = private unnamed_addr constant [43 x i8] c"crc64338477404e88479c/InnerGestureListener\00", align 1
@.tmr.836 = private unnamed_addr constant [41 x i8] c"crc64338477404e88479c/InnerScaleListener\00", align 1
@.tmr.837 = private unnamed_addr constant [36 x i8] c"crc64338477404e88479c/MauiViewPager\00", align 1
@.tmr.838 = private unnamed_addr constant [54 x i8] c"crc64338477404e88479c/MultiPageFragmentStateAdapter_1\00", align 1
@.tmr.839 = private unnamed_addr constant [44 x i8] c"crc64338477404e88479c/PointerGestureHandler\00", align 1
@.tmr.840 = private unnamed_addr constant [47 x i8] c"crc64338477404e88479c/TapAndPanGestureDetector\00", align 1
@.tmr.841 = private unnamed_addr constant [59 x i8] c"crc64338477404e88479c/ModalNavigationManager_ModalFragment\00", align 1
@.tmr.842 = private unnamed_addr constant [81 x i8] c"crc64338477404e88479c/ModalNavigationManager_ModalFragment_CustomComponentDialog\00", align 1
@.tmr.843 = private unnamed_addr constant [90 x i8] c"crc64338477404e88479c/ModalNavigationManager_ModalFragment_CustomComponentDialog_CallBack\00", align 1
@.tmr.844 = private unnamed_addr constant [36 x i8] c"crc640ec207abc449b2ca/ContainerView\00", align 1
@.tmr.845 = private unnamed_addr constant [40 x i8] c"crc640ec207abc449b2ca/CustomFrameLayout\00", align 1
@.tmr.846 = private unnamed_addr constant [43 x i8] c"crc640ec207abc449b2ca/ShellContentFragment\00", align 1
@.tmr.847 = private unnamed_addr constant [40 x i8] c"crc640ec207abc449b2ca/ShellFlyoutLayout\00", align 1
@.tmr.848 = private unnamed_addr constant [49 x i8] c"crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter\00", align 1
@.tmr.849 = private unnamed_addr constant [67 x i8] c"crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter_ShellLinearLayout\00", align 1
@.tmr.850 = private unnamed_addr constant [67 x i8] c"crc640ec207abc449b2ca/ShellFlyoutRecyclerAdapter_ElementViewHolder\00", align 1
@.tmr.851 = private unnamed_addr constant [42 x i8] c"crc640ec207abc449b2ca/ShellFlyoutRenderer\00", align 1
@.tmr.852 = private unnamed_addr constant [58 x i8] c"crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer\00", align 1
@.tmr.853 = private unnamed_addr constant [74 x i8] c"crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer_WindowsListener\00", align 1
@.tmr.854 = private unnamed_addr constant [74 x i8] c"crc640ec207abc449b2ca/ShellFlyoutTemplatedContentRenderer_HeaderContainer\00", align 1
@.tmr.855 = private unnamed_addr constant [44 x i8] c"crc640ec207abc449b2ca/RecyclerViewContainer\00", align 1
@.tmr.856 = private unnamed_addr constant [42 x i8] c"crc640ec207abc449b2ca/ScrollLayoutManager\00", align 1
@.tmr.857 = private unnamed_addr constant [45 x i8] c"crc640ec207abc449b2ca/ShellFragmentContainer\00", align 1
@.tmr.858 = private unnamed_addr constant [48 x i8] c"crc640ec207abc449b2ca/ShellFragmentStateAdapter\00", align 1
@.tmr.859 = private unnamed_addr constant [40 x i8] c"crc640ec207abc449b2ca/ShellItemRenderer\00", align 1
@.tmr.860 = private unnamed_addr constant [44 x i8] c"crc640ec207abc449b2ca/ShellItemRendererBase\00", align 1
@.tmr.861 = private unnamed_addr constant [41 x i8] c"crc640ec207abc449b2ca/ShellPageContainer\00", align 1
@.tmr.862 = private unnamed_addr constant [38 x i8] c"crc640ec207abc449b2ca/ShellSearchView\00", align 1
@.tmr.863 = private unnamed_addr constant [58 x i8] c"crc640ec207abc449b2ca/ShellSearchView_ClipDrawableWrapper\00", align 1
@.tmr.864 = private unnamed_addr constant [45 x i8] c"crc640ec207abc449b2ca/ShellSearchViewAdapter\00", align 1
@.tmr.865 = private unnamed_addr constant [58 x i8] c"crc640ec207abc449b2ca/ShellSearchViewAdapter_CustomFilter\00", align 1
@.tmr.866 = private unnamed_addr constant [59 x i8] c"crc640ec207abc449b2ca/ShellSearchViewAdapter_ObjectWrapper\00", align 1
@.tmr.867 = private unnamed_addr constant [43 x i8] c"crc640ec207abc449b2ca/ShellSectionRenderer\00", align 1
@.tmr.868 = private unnamed_addr constant [64 x i8] c"crc640ec207abc449b2ca/ShellSectionRenderer_ViewPagerPageChanged\00", align 1
@.tmr.869 = private unnamed_addr constant [42 x i8] c"crc640ec207abc449b2ca/ShellToolbarTracker\00", align 1
@.tmr.870 = private unnamed_addr constant [67 x i8] c"crc640ec207abc449b2ca/ShellToolbarTracker_FlyoutIconDrawerDrawable\00", align 1
@.tmr.871 = private unnamed_addr constant [49 x i8] c"crc649ff77a65592e7d55/TabbedPageManager_TempView\00", align 1
@.tmr.872 = private unnamed_addr constant [50 x i8] c"crc649ff77a65592e7d55/TabbedPageManager_Listeners\00", align 1
@.tmr.873 = private unnamed_addr constant [44 x i8] c"crc645d80431ce5f73f11/CarouselViewAdapter_2\00", align 1
@.tmr.874 = private unnamed_addr constant [39 x i8] c"crc645d80431ce5f73f11/EmptyViewAdapter\00", align 1
@.tmr.875 = private unnamed_addr constant [50 x i8] c"crc645d80431ce5f73f11/GroupableItemsViewAdapter_2\00", align 1
@.tmr.876 = private unnamed_addr constant [41 x i8] c"crc645d80431ce5f73f11/ItemsViewAdapter_2\00", align 1
@.tmr.877 = private unnamed_addr constant [52 x i8] c"crc645d80431ce5f73f11/ReorderableItemsViewAdapter_2\00", align 1
@.tmr.878 = private unnamed_addr constant [51 x i8] c"crc645d80431ce5f73f11/SelectableItemsViewAdapter_2\00", align 1
@.tmr.879 = private unnamed_addr constant [51 x i8] c"crc645d80431ce5f73f11/StructuredItemsViewAdapter_2\00", align 1
@.tmr.880 = private unnamed_addr constant [52 x i8] c"crc645d80431ce5f73f11/CarouselSpacingItemDecoration\00", align 1
@.tmr.881 = private unnamed_addr constant [51 x i8] c"crc645d80431ce5f73f11/CarouselViewOnScrollListener\00", align 1
@.tmr.882 = private unnamed_addr constant [41 x i8] c"crc645d80431ce5f73f11/DataChangeObserver\00", align 1
@.tmr.883 = private unnamed_addr constant [47 x i8] c"crc645d80431ce5f73f11/GridLayoutSpanSizeLookup\00", align 1
@.tmr.884 = private unnamed_addr constant [38 x i8] c"crc645d80431ce5f73f11/ItemContentView\00", align 1
@.tmr.885 = private unnamed_addr constant [47 x i8] c"crc645d80431ce5f73f11/MauiCarouselRecyclerView\00", align 1
@.tmr.886 = private unnamed_addr constant [82 x i8] c"crc645d80431ce5f73f11/MauiCarouselRecyclerView_CarouselViewOnGlobalLayoutListener\00", align 1
@.tmr.887 = private unnamed_addr constant [41 x i8] c"crc645d80431ce5f73f11/MauiRecyclerView_3\00", align 1
@.tmr.888 = private unnamed_addr constant [47 x i8] c"crc645d80431ce5f73f11/PositionalSmoothScroller\00", align 1
@.tmr.889 = private unnamed_addr constant [51 x i8] c"crc645d80431ce5f73f11/RecyclerViewScrollListener_2\00", align 1
@.tmr.890 = private unnamed_addr constant [35 x i8] c"crc645d80431ce5f73f11/ScrollHelper\00", align 1
@.tmr.891 = private unnamed_addr constant [43 x i8] c"crc645d80431ce5f73f11/SelectableViewHolder\00", align 1
@.tmr.892 = private unnamed_addr constant [52 x i8] c"crc645d80431ce5f73f11/SimpleItemTouchHelperCallback\00", align 1
@.tmr.893 = private unnamed_addr constant [39 x i8] c"crc645d80431ce5f73f11/SimpleViewHolder\00", align 1
@.tmr.894 = private unnamed_addr constant [43 x i8] c"crc645d80431ce5f73f11/SizedItemContentView\00", align 1
@.tmr.895 = private unnamed_addr constant [39 x i8] c"crc645d80431ce5f73f11/CenterSnapHelper\00", align 1
@.tmr.896 = private unnamed_addr constant [37 x i8] c"crc645d80431ce5f73f11/EdgeSnapHelper\00", align 1
@.tmr.897 = private unnamed_addr constant [42 x i8] c"crc645d80431ce5f73f11/EndSingleSnapHelper\00", align 1
@.tmr.898 = private unnamed_addr constant [36 x i8] c"crc645d80431ce5f73f11/EndSnapHelper\00", align 1
@.tmr.899 = private unnamed_addr constant [42 x i8] c"crc645d80431ce5f73f11/NongreedySnapHelper\00", align 1
@.tmr.900 = private unnamed_addr constant [64 x i8] c"crc645d80431ce5f73f11/NongreedySnapHelper_InitialScrollListener\00", align 1
@.tmr.901 = private unnamed_addr constant [39 x i8] c"crc645d80431ce5f73f11/SingleSnapHelper\00", align 1
@.tmr.902 = private unnamed_addr constant [44 x i8] c"crc645d80431ce5f73f11/StartSingleSnapHelper\00", align 1
@.tmr.903 = private unnamed_addr constant [38 x i8] c"crc645d80431ce5f73f11/StartSnapHelper\00", align 1
@.tmr.904 = private unnamed_addr constant [44 x i8] c"crc645d80431ce5f73f11/SpacingItemDecoration\00", align 1
@.tmr.905 = private unnamed_addr constant [46 x i8] c"crc645d80431ce5f73f11/TemplatedItemViewHolder\00", align 1
@.tmr.906 = private unnamed_addr constant [37 x i8] c"crc645d80431ce5f73f11/TextViewHolder\00", align 1
@.tmr.907 = private unnamed_addr constant [36 x i8] c"crc64e1fb321c08285b90/FrameRenderer\00", align 1
@.tmr.908 = private unnamed_addr constant [35 x i8] c"crc64e1fb321c08285b90/ViewRenderer\00", align 1
@.tmr.909 = private unnamed_addr constant [37 x i8] c"crc64e1fb321c08285b90/ViewRenderer_2\00", align 1
@.tmr.910 = private unnamed_addr constant [46 x i8] c"crc64e1fb321c08285b90/VisualElementRenderer_1\00", align 1
@.tmr.911 = private unnamed_addr constant [35 x i8] c"crc64e1fb321c08285b90/BaseCellView\00", align 1
@.tmr.912 = private unnamed_addr constant [34 x i8] c"crc64e1fb321c08285b90/CellAdapter\00", align 1
@.tmr.913 = private unnamed_addr constant [50 x i8] c"crc64e1fb321c08285b90/CellRenderer_RendererHolder\00", align 1
@.tmr.914 = private unnamed_addr constant [45 x i8] c"crc64e1fb321c08285b90/ConditionalFocusLayout\00", align 1
@.tmr.915 = private unnamed_addr constant [40 x i8] c"crc64e1fb321c08285b90/EntryCellEditText\00", align 1
@.tmr.916 = private unnamed_addr constant [36 x i8] c"crc64e1fb321c08285b90/EntryCellView\00", align 1
@.tmr.917 = private unnamed_addr constant [45 x i8] c"crc64e1fb321c08285b90/GroupedListViewAdapter\00", align 1
@.tmr.918 = private unnamed_addr constant [38 x i8] c"crc64e1fb321c08285b90/ListViewAdapter\00", align 1
@.tmr.919 = private unnamed_addr constant [39 x i8] c"crc64e1fb321c08285b90/ListViewRenderer\00", align 1
@.tmr.920 = private unnamed_addr constant [49 x i8] c"crc64e1fb321c08285b90/ListViewRenderer_Container\00", align 1
@.tmr.921 = private unnamed_addr constant [82 x i8] c"crc64e1fb321c08285b90/ListViewRenderer_SwipeRefreshLayoutWithFixedNestedScrolling\00", align 1
@.tmr.922 = private unnamed_addr constant [74 x i8] c"crc64e1fb321c08285b90/ListViewRenderer_ListViewSwipeRefreshLayoutListener\00", align 1
@.tmr.923 = private unnamed_addr constant [62 x i8] c"crc64e1fb321c08285b90/ListViewRenderer_ListViewScrollDetector\00", align 1
@.tmr.924 = private unnamed_addr constant [37 x i8] c"crc64e1fb321c08285b90/SwitchCellView\00", align 1
@.tmr.925 = private unnamed_addr constant [52 x i8] c"crc64e1fb321c08285b90/TextCellRenderer_TextCellView\00", align 1
@.tmr.926 = private unnamed_addr constant [57 x i8] c"crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer\00", align 1
@.tmr.927 = private unnamed_addr constant [76 x i8] c"crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer_TapGestureListener\00", align 1
@.tmr.928 = private unnamed_addr constant [82 x i8] c"crc64e1fb321c08285b90/ViewCellRenderer_ViewCellContainer_LongPressGestureListener\00", align 1
@.tmr.929 = private unnamed_addr constant [45 x i8] c"crc64e1fb321c08285b90/TableViewModelRenderer\00", align 1
@.tmr.930 = private unnamed_addr constant [40 x i8] c"crc64e1fb321c08285b90/TableViewRenderer\00", align 1
@.tmr.931 = private unnamed_addr constant [57 x i8] c"androidx/appcompat/graphics/drawable/DrawerArrowDrawable\00", align 1
@.tmr.932 = private unnamed_addr constant [34 x i8] c"androidx/appcompat/widget/Toolbar\00", align 1
@.tmr.933 = private unnamed_addr constant [67 x i8] c"androidx/appcompat/widget/Toolbar_NavigationOnClickEventDispatcher\00", align 1
@.tmr.934 = private unnamed_addr constant [47 x i8] c"androidx/appcompat/widget/Toolbar$LayoutParams\00", align 1
@.tmr.935 = private unnamed_addr constant [58 x i8] c"androidx/appcompat/widget/Toolbar$OnMenuItemClickListener\00", align 1
@.tmr.936 = private unnamed_addr constant [74 x i8] c"mono/androidx/appcompat/widget/Toolbar_OnMenuItemClickListenerImplementor\00", align 1
@.tmr.937 = private unnamed_addr constant [56 x i8] c"androidx/appcompat/widget/AppCompatAutoCompleteTextView\00", align 1
@.tmr.938 = private unnamed_addr constant [42 x i8] c"androidx/appcompat/widget/AppCompatButton\00", align 1
@.tmr.939 = private unnamed_addr constant [44 x i8] c"androidx/appcompat/widget/AppCompatCheckBox\00", align 1
@.tmr.940 = private unnamed_addr constant [44 x i8] c"androidx/appcompat/widget/AppCompatEditText\00", align 1
@.tmr.941 = private unnamed_addr constant [47 x i8] c"androidx/appcompat/widget/AppCompatImageButton\00", align 1
@.tmr.942 = private unnamed_addr constant [45 x i8] c"androidx/appcompat/widget/AppCompatImageView\00", align 1
@.tmr.943 = private unnamed_addr constant [47 x i8] c"androidx/appcompat/widget/AppCompatRadioButton\00", align 1
@.tmr.944 = private unnamed_addr constant [44 x i8] c"androidx/appcompat/widget/AppCompatTextView\00", align 1
@.tmr.945 = private unnamed_addr constant [39 x i8] c"androidx/appcompat/widget/DecorToolbar\00", align 1
@.tmr.946 = private unnamed_addr constant [45 x i8] c"androidx/appcompat/widget/LinearLayoutCompat\00", align 1
@.tmr.947 = private unnamed_addr constant [58 x i8] c"androidx/appcompat/widget/LinearLayoutCompat$LayoutParams\00", align 1
@.tmr.948 = private unnamed_addr constant [52 x i8] c"androidx/appcompat/widget/ScrollingTabContainerView\00", align 1
@.tmr.949 = private unnamed_addr constant [75 x i8] c"androidx/appcompat/widget/ScrollingTabContainerView$VisibilityAnimListener\00", align 1
@.tmr.950 = private unnamed_addr constant [37 x i8] c"androidx/appcompat/widget/SearchView\00", align 1
@.tmr.951 = private unnamed_addr constant [53 x i8] c"androidx/appcompat/widget/SearchView$OnCloseListener\00", align 1
@.tmr.952 = private unnamed_addr constant [69 x i8] c"mono/androidx/appcompat/widget/SearchView_OnCloseListenerImplementor\00", align 1
@.tmr.953 = private unnamed_addr constant [57 x i8] c"androidx/appcompat/widget/SearchView$OnQueryTextListener\00", align 1
@.tmr.954 = private unnamed_addr constant [73 x i8] c"mono/androidx/appcompat/widget/SearchView_OnQueryTextListenerImplementor\00", align 1
@.tmr.955 = private unnamed_addr constant [58 x i8] c"androidx/appcompat/widget/SearchView$OnSuggestionListener\00", align 1
@.tmr.956 = private unnamed_addr constant [74 x i8] c"mono/androidx/appcompat/widget/SearchView_OnSuggestionListenerImplementor\00", align 1
@.tmr.957 = private unnamed_addr constant [39 x i8] c"androidx/appcompat/widget/SwitchCompat\00", align 1
@.tmr.958 = private unnamed_addr constant [40 x i8] c"androidx/appcompat/widget/TooltipCompat\00", align 1
@.tmr.959 = private unnamed_addr constant [35 x i8] c"androidx/appcompat/app/AlertDialog\00", align 1
@.tmr.960 = private unnamed_addr constant [43 x i8] c"androidx/appcompat/app/AlertDialog$Builder\00", align 1
@.tmr.961 = private unnamed_addr constant [78 x i8] c"androidx/appcompat/app/AlertDialog_IDialogInterfaceOnClickListenerImplementor\00", align 1
@.tmr.962 = private unnamed_addr constant [79 x i8] c"androidx/appcompat/app/AlertDialog_IDialogInterfaceOnCancelListenerImplementor\00", align 1
@.tmr.963 = private unnamed_addr constant [89 x i8] c"androidx/appcompat/app/AlertDialog_IDialogInterfaceOnMultiChoiceClickListenerImplementor\00", align 1
@.tmr.964 = private unnamed_addr constant [33 x i8] c"androidx/appcompat/app/ActionBar\00", align 1
@.tmr.965 = private unnamed_addr constant [46 x i8] c"androidx/appcompat/app/ActionBar$LayoutParams\00", align 1
@.tmr.966 = private unnamed_addr constant [58 x i8] c"androidx/appcompat/app/ActionBar$OnMenuVisibilityListener\00", align 1
@.tmr.967 = private unnamed_addr constant [74 x i8] c"mono/androidx/appcompat/app/ActionBar_OnMenuVisibilityListenerImplementor\00", align 1
@.tmr.968 = private unnamed_addr constant [54 x i8] c"androidx/appcompat/app/ActionBar$OnNavigationListener\00", align 1
@.tmr.969 = private unnamed_addr constant [37 x i8] c"androidx/appcompat/app/ActionBar$Tab\00", align 1
@.tmr.970 = private unnamed_addr constant [45 x i8] c"androidx/appcompat/app/ActionBar$TabListener\00", align 1
@.tmr.971 = private unnamed_addr constant [45 x i8] c"androidx/appcompat/app/ActionBarDrawerToggle\00", align 1
@.tmr.972 = private unnamed_addr constant [54 x i8] c"androidx/appcompat/app/ActionBarDrawerToggle$Delegate\00", align 1
@.tmr.973 = private unnamed_addr constant [41 x i8] c"androidx/appcompat/app/AppCompatActivity\00", align 1
@.tmr.974 = private unnamed_addr constant [41 x i8] c"androidx/appcompat/app/AppCompatDelegate\00", align 1
@.tmr.975 = private unnamed_addr constant [39 x i8] c"androidx/appcompat/app/AppCompatDialog\00", align 1
@.tmr.976 = private unnamed_addr constant [41 x i8] c"androidx/appcompat/app/AppCompatCallback\00", align 1
@.tmr.977 = private unnamed_addr constant [35 x i8] c"androidx/appcompat/view/ActionMode\00", align 1
@.tmr.978 = private unnamed_addr constant [44 x i8] c"androidx/appcompat/view/ActionMode$Callback\00", align 1
@.tmr.979 = private unnamed_addr constant [41 x i8] c"androidx/appcompat/view/menu/MenuBuilder\00", align 1
@.tmr.980 = private unnamed_addr constant [50 x i8] c"androidx/appcompat/view/menu/MenuBuilder$Callback\00", align 1
@.tmr.981 = private unnamed_addr constant [52 x i8] c"androidx/appcompat/view/menu/MenuPresenter$Callback\00", align 1
@.tmr.982 = private unnamed_addr constant [43 x i8] c"androidx/appcompat/view/menu/MenuPresenter\00", align 1
@.tmr.983 = private unnamed_addr constant [38 x i8] c"androidx/appcompat/view/menu/MenuView\00", align 1
@.tmr.984 = private unnamed_addr constant [42 x i8] c"androidx/appcompat/view/menu/MenuItemImpl\00", align 1
@.tmr.985 = private unnamed_addr constant [44 x i8] c"androidx/appcompat/view/menu/SubMenuBuilder\00", align 1
@.tmr.986 = private unnamed_addr constant [35 x i8] c"crc64f45d91b14e554859/MainActivity\00", align 1
@.tmr.987 = private unnamed_addr constant [38 x i8] c"crc64f45d91b14e554859/MainApplication\00", align 1
@.tmr.988 = private unnamed_addr constant [39 x i8] c"androidx/viewpager/widget/PagerAdapter\00", align 1
@.tmr.989 = private unnamed_addr constant [36 x i8] c"androidx/viewpager/widget/ViewPager\00", align 1
@.tmr.990 = private unnamed_addr constant [60 x i8] c"androidx/viewpager/widget/ViewPager$OnAdapterChangeListener\00", align 1
@.tmr.991 = private unnamed_addr constant [76 x i8] c"mono/androidx/viewpager/widget/ViewPager_OnAdapterChangeListenerImplementor\00", align 1
@.tmr.992 = private unnamed_addr constant [57 x i8] c"androidx/viewpager/widget/ViewPager$OnPageChangeListener\00", align 1
@.tmr.993 = private unnamed_addr constant [73 x i8] c"mono/androidx/viewpager/widget/ViewPager_OnPageChangeListenerImplementor\00", align 1
@.tmr.994 = private unnamed_addr constant [52 x i8] c"androidx/viewpager/widget/ViewPager$PageTransformer\00", align 1
@.tmr.995 = private unnamed_addr constant [59 x i8] c"crc6468b6408a11370c2f/WebAuthenticatorIntermediateActivity\00", align 1
@.tmr.996 = private unnamed_addr constant [39 x i8] c"microsoft/maui/essentials/fileProvider\00", align 1
@.tmr.997 = private unnamed_addr constant [52 x i8] c"crc64e53d2f592022988e/ConnectivityBroadcastReceiver\00", align 1
@.tmr.998 = private unnamed_addr constant [47 x i8] c"crc64ba438d8f48cf7e75/ActivityResultCallback_1\00", align 1
@.tmr.999 = private unnamed_addr constant [55 x i8] c"crc64ba438d8f48cf7e75/ActivityLifecycleContextListener\00", align 1
@.tmr.1000 = private unnamed_addr constant [43 x i8] c"crc64ba438d8f48cf7e75/IntermediateActivity\00", align 1
@.tmr.1001 = private unnamed_addr constant [59 x i8] c"crc640a8d9a12ddbf2cf2/DeviceDisplayImplementation_Listener\00", align 1
@.tmr.1002 = private unnamed_addr constant [47 x i8] c"crc640a8d9a12ddbf2cf2/BatteryBroadcastReceiver\00", align 1
@.tmr.1003 = private unnamed_addr constant [51 x i8] c"crc640a8d9a12ddbf2cf2/EnergySaverBroadcastReceiver\00", align 1
@.tmr.1004 = private unnamed_addr constant [52 x i8] c"androidx/coordinatorlayout/widget/CoordinatorLayout\00", align 1
@.tmr.1005 = private unnamed_addr constant [61 x i8] c"androidx/coordinatorlayout/widget/CoordinatorLayout$Behavior\00", align 1
@.tmr.1006 = private unnamed_addr constant [65 x i8] c"androidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams\00", align 1
@.tmr.1007 = private unnamed_addr constant [29 x i8] c"androidx/lifecycle/Lifecycle\00", align 1
@.tmr.1008 = private unnamed_addr constant [35 x i8] c"androidx/lifecycle/Lifecycle$Event\00", align 1
@.tmr.1009 = private unnamed_addr constant [35 x i8] c"androidx/lifecycle/Lifecycle$State\00", align 1
@.tmr.1010 = private unnamed_addr constant [35 x i8] c"androidx/lifecycle/AtomicReference\00", align 1
@.tmr.1011 = private unnamed_addr constant [37 x i8] c"androidx/lifecycle/LifecycleObserver\00", align 1
@.tmr.1012 = private unnamed_addr constant [34 x i8] c"androidx/lifecycle/LifecycleOwner\00", align 1
@.tmr.1013 = private unnamed_addr constant [34 x i8] c"kotlinx/coroutines/CoroutineScope\00", align 1
@.tmr.1014 = private unnamed_addr constant [29 x i8] c"kotlinx/coroutines/flow/Flow\00", align 1
@.tmr.1015 = private unnamed_addr constant [38 x i8] c"kotlinx/coroutines/flow/FlowCollector\00", align 1
@.tmr.1016 = private unnamed_addr constant [42 x i8] c"kotlinx/coroutines/flow/MutableSharedFlow\00", align 1
@.tmr.1017 = private unnamed_addr constant [41 x i8] c"kotlinx/coroutines/flow/MutableStateFlow\00", align 1
@.tmr.1018 = private unnamed_addr constant [35 x i8] c"kotlinx/coroutines/flow/SharedFlow\00", align 1
@.tmr.1019 = private unnamed_addr constant [34 x i8] c"kotlinx/coroutines/flow/StateFlow\00", align 1
@.tmr.1020 = private unnamed_addr constant [46 x i8] c"kotlinx/serialization/DeserializationStrategy\00", align 1
@.tmr.1021 = private unnamed_addr constant [34 x i8] c"kotlinx/serialization/KSerializer\00", align 1
@.tmr.1022 = private unnamed_addr constant [44 x i8] c"kotlinx/serialization/SerializationStrategy\00", align 1
@.tmr.1023 = private unnamed_addr constant [58 x i8] c"kotlinx/serialization/encoding/CompositeDecoder$Companion\00", align 1
@.tmr.1024 = private unnamed_addr constant [48 x i8] c"kotlinx/serialization/encoding/CompositeDecoder\00", align 1
@.tmr.1025 = private unnamed_addr constant [48 x i8] c"kotlinx/serialization/encoding/CompositeEncoder\00", align 1
@.tmr.1026 = private unnamed_addr constant [39 x i8] c"kotlinx/serialization/encoding/Decoder\00", align 1
@.tmr.1027 = private unnamed_addr constant [39 x i8] c"kotlinx/serialization/encoding/Encoder\00", align 1
@.tmr.1028 = private unnamed_addr constant [51 x i8] c"kotlinx/serialization/descriptors/SerialDescriptor\00", align 1
@.tmr.1029 = private unnamed_addr constant [45 x i8] c"kotlinx/serialization/descriptors/SerialKind\00", align 1
@.tmr.1030 = private unnamed_addr constant [52 x i8] c"androidx/security/crypto/EncryptedSharedPreferences\00", align 1
@.tmr.1031 = private unnamed_addr constant [76 x i8] c"androidx/security/crypto/EncryptedSharedPreferences$PrefKeyEncryptionScheme\00", align 1
@.tmr.1032 = private unnamed_addr constant [78 x i8] c"androidx/security/crypto/EncryptedSharedPreferences$PrefValueEncryptionScheme\00", align 1
@.tmr.1033 = private unnamed_addr constant [35 x i8] c"androidx/security/crypto/MasterKey\00", align 1
@.tmr.1034 = private unnamed_addr constant [43 x i8] c"androidx/security/crypto/MasterKey$Builder\00", align 1
@.tmr.1035 = private unnamed_addr constant [45 x i8] c"androidx/security/crypto/MasterKey$KeyScheme\00", align 1
@.tmr.1036 = private unnamed_addr constant [36 x i8] c"androidx/lifecycle/SavedStateHandle\00", align 1
@.tmr.1037 = private unnamed_addr constant [38 x i8] c"androidx/collection/SparseArrayCompat\00", align 1
@.tmr.1038 = private unnamed_addr constant [47 x i8] c"androidx/recyclerview/widget/GridLayoutManager\00", align 1
@.tmr.1039 = private unnamed_addr constant [62 x i8] c"androidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup\00", align 1
@.tmr.1040 = private unnamed_addr constant [45 x i8] c"androidx/recyclerview/widget/ItemTouchUIUtil\00", align 1
@.tmr.1041 = private unnamed_addr constant [45 x i8] c"androidx/recyclerview/widget/ItemTouchHelper\00", align 1
@.tmr.1042 = private unnamed_addr constant [54 x i8] c"androidx/recyclerview/widget/ItemTouchHelper$Callback\00", align 1
@.tmr.1043 = private unnamed_addr constant [49 x i8] c"androidx/recyclerview/widget/LinearLayoutManager\00", align 1
@.tmr.1044 = private unnamed_addr constant [50 x i8] c"androidx/recyclerview/widget/LinearSmoothScroller\00", align 1
@.tmr.1045 = private unnamed_addr constant [46 x i8] c"androidx/recyclerview/widget/LinearSnapHelper\00", align 1
@.tmr.1046 = private unnamed_addr constant [47 x i8] c"androidx/recyclerview/widget/OrientationHelper\00", align 1
@.tmr.1047 = private unnamed_addr constant [45 x i8] c"androidx/recyclerview/widget/PagerSnapHelper\00", align 1
@.tmr.1048 = private unnamed_addr constant [42 x i8] c"androidx/recyclerview/widget/RecyclerView\00", align 1
@.tmr.1049 = private unnamed_addr constant [50 x i8] c"androidx/recyclerview/widget/RecyclerView$Adapter\00", align 1
@.tmr.1050 = private unnamed_addr constant [73 x i8] c"androidx/recyclerview/widget/RecyclerView$Adapter$StateRestorationPolicy\00", align 1
@.tmr.1051 = private unnamed_addr constant [62 x i8] c"androidx/recyclerview/widget/RecyclerView$AdapterDataObserver\00", align 1
@.tmr.1052 = private unnamed_addr constant [68 x i8] c"androidx/recyclerview/widget/RecyclerView$ChildDrawingOrderCallback\00", align 1
@.tmr.1053 = private unnamed_addr constant [60 x i8] c"androidx/recyclerview/widget/RecyclerView$EdgeEffectFactory\00", align 1
@.tmr.1054 = private unnamed_addr constant [55 x i8] c"androidx/recyclerview/widget/RecyclerView$ItemAnimator\00", align 1
@.tmr.1055 = private unnamed_addr constant [84 x i8] c"androidx/recyclerview/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener\00", align 1
@.tmr.1056 = private unnamed_addr constant [70 x i8] c"androidx/recyclerview/widget/RecyclerView$ItemAnimator$ItemHolderInfo\00", align 1
@.tmr.1057 = private unnamed_addr constant [57 x i8] c"androidx/recyclerview/widget/RecyclerView$ItemDecoration\00", align 1
@.tmr.1058 = private unnamed_addr constant [56 x i8] c"androidx/recyclerview/widget/RecyclerView$LayoutManager\00", align 1
@.tmr.1059 = private unnamed_addr constant [79 x i8] c"androidx/recyclerview/widget/RecyclerView$LayoutManager$LayoutPrefetchRegistry\00", align 1
@.tmr.1060 = private unnamed_addr constant [67 x i8] c"androidx/recyclerview/widget/RecyclerView$LayoutManager$Properties\00", align 1
@.tmr.1061 = private unnamed_addr constant [55 x i8] c"androidx/recyclerview/widget/RecyclerView$LayoutParams\00", align 1
@.tmr.1062 = private unnamed_addr constant [75 x i8] c"androidx/recyclerview/widget/RecyclerView$OnChildAttachStateChangeListener\00", align 1
@.tmr.1063 = private unnamed_addr constant [91 x i8] c"mono/androidx/recyclerview/widget/RecyclerView_OnChildAttachStateChangeListenerImplementor\00", align 1
@.tmr.1064 = private unnamed_addr constant [58 x i8] c"androidx/recyclerview/widget/RecyclerView$OnFlingListener\00", align 1
@.tmr.1065 = private unnamed_addr constant [62 x i8] c"androidx/recyclerview/widget/RecyclerView$OnItemTouchListener\00", align 1
@.tmr.1066 = private unnamed_addr constant [78 x i8] c"mono/androidx/recyclerview/widget/RecyclerView_OnItemTouchListenerImplementor\00", align 1
@.tmr.1067 = private unnamed_addr constant [59 x i8] c"androidx/recyclerview/widget/RecyclerView$OnScrollListener\00", align 1
@.tmr.1068 = private unnamed_addr constant [59 x i8] c"androidx/recyclerview/widget/RecyclerView$RecycledViewPool\00", align 1
@.tmr.1069 = private unnamed_addr constant [51 x i8] c"androidx/recyclerview/widget/RecyclerView$Recycler\00", align 1
@.tmr.1070 = private unnamed_addr constant [59 x i8] c"androidx/recyclerview/widget/RecyclerView$RecyclerListener\00", align 1
@.tmr.1071 = private unnamed_addr constant [75 x i8] c"mono/androidx/recyclerview/widget/RecyclerView_RecyclerListenerImplementor\00", align 1
@.tmr.1072 = private unnamed_addr constant [57 x i8] c"androidx/recyclerview/widget/RecyclerView$SmoothScroller\00", align 1
@.tmr.1073 = private unnamed_addr constant [64 x i8] c"androidx/recyclerview/widget/RecyclerView$SmoothScroller$Action\00", align 1
@.tmr.1074 = private unnamed_addr constant [48 x i8] c"androidx/recyclerview/widget/RecyclerView$State\00", align 1
@.tmr.1075 = private unnamed_addr constant [61 x i8] c"androidx/recyclerview/widget/RecyclerView$ViewCacheExtension\00", align 1
@.tmr.1076 = private unnamed_addr constant [53 x i8] c"androidx/recyclerview/widget/RecyclerView$ViewHolder\00", align 1
@.tmr.1077 = private unnamed_addr constant [63 x i8] c"androidx/recyclerview/widget/RecyclerViewAccessibilityDelegate\00", align 1
@.tmr.1078 = private unnamed_addr constant [40 x i8] c"androidx/recyclerview/widget/SnapHelper\00", align 1
@.tmr.1079 = private unnamed_addr constant [39 x i8] c"androidx/fragment/app/FragmentActivity\00", align 1
@.tmr.1080 = private unnamed_addr constant [37 x i8] c"androidx/fragment/app/DialogFragment\00", align 1
@.tmr.1081 = private unnamed_addr constant [31 x i8] c"androidx/fragment/app/Fragment\00", align 1
@.tmr.1082 = private unnamed_addr constant [42 x i8] c"androidx/fragment/app/Fragment$SavedState\00", align 1
@.tmr.1083 = private unnamed_addr constant [40 x i8] c"androidx/fragment/app/FragmentContainer\00", align 1
@.tmr.1084 = private unnamed_addr constant [44 x i8] c"androidx/fragment/app/FragmentContainerView\00", align 1
@.tmr.1085 = private unnamed_addr constant [38 x i8] c"androidx/fragment/app/FragmentFactory\00", align 1
@.tmr.1086 = private unnamed_addr constant [43 x i8] c"androidx/fragment/app/FragmentHostCallback\00", align 1
@.tmr.1087 = private unnamed_addr constant [38 x i8] c"androidx/fragment/app/FragmentManager\00", align 1
@.tmr.1088 = private unnamed_addr constant [53 x i8] c"androidx/fragment/app/FragmentManager$BackStackEntry\00", align 1
@.tmr.1089 = private unnamed_addr constant [65 x i8] c"androidx/fragment/app/FragmentManager$FragmentLifecycleCallbacks\00", align 1
@.tmr.1090 = private unnamed_addr constant [65 x i8] c"androidx/fragment/app/FragmentManager$OnBackStackChangedListener\00", align 1
@.tmr.1091 = private unnamed_addr constant [81 x i8] c"mono/androidx/fragment/app/FragmentManager_OnBackStackChangedListenerImplementor\00", align 1
@.tmr.1092 = private unnamed_addr constant [42 x i8] c"androidx/fragment/app/FragmentTransaction\00", align 1
@.tmr.1093 = private unnamed_addr constant [47 x i8] c"androidx/fragment/app/FragmentOnAttachListener\00", align 1
@.tmr.1094 = private unnamed_addr constant [63 x i8] c"mono/androidx/fragment/app/FragmentOnAttachListenerImplementor\00", align 1
@.tmr.1095 = private unnamed_addr constant [45 x i8] c"androidx/fragment/app/FragmentResultListener\00", align 1
@.tmr.1096 = private unnamed_addr constant [52 x i8] c"androidx/fragment/app/strictmode/FragmentStrictMode\00", align 1
@.tmr.1097 = private unnamed_addr constant [59 x i8] c"androidx/fragment/app/strictmode/FragmentStrictMode$Policy\00", align 1
@.tmr.1098 = private unnamed_addr constant [43 x i8] c"androidx/fragment/app/strictmode/Violation\00", align 1
@.tmr.1099 = private unnamed_addr constant [39 x i8] c"androidx/savedstate/SavedStateRegistry\00", align 1
@.tmr.1100 = private unnamed_addr constant [58 x i8] c"androidx/savedstate/SavedStateRegistry$SavedStateProvider\00", align 1
@.tmr.1101 = private unnamed_addr constant [50 x i8] c"androidx/appcompat/content/res/AppCompatResources\00", align 1
@.tmr.1102 = private unnamed_addr constant [59 x i8] c"androidx/appcompat/graphics/drawable/DrawableWrapperCompat\00", align 1
@.tmr.1103 = private unnamed_addr constant [16 x i8] c"kotlin/Function\00", align 1
@.tmr.1104 = private unnamed_addr constant [26 x i8] c"kotlin/sequences/Sequence\00", align 1
@.tmr.1105 = private unnamed_addr constant [33 x i8] c"kotlin/reflect/KAnnotatedElement\00", align 1
@.tmr.1106 = private unnamed_addr constant [25 x i8] c"kotlin/reflect/KCallable\00", align 1
@.tmr.1107 = private unnamed_addr constant [22 x i8] c"kotlin/reflect/KClass\00", align 1
@.tmr.1108 = private unnamed_addr constant [27 x i8] c"kotlin/reflect/KClassifier\00", align 1
@.tmr.1109 = private unnamed_addr constant [37 x i8] c"kotlin/reflect/KDeclarationContainer\00", align 1
@.tmr.1110 = private unnamed_addr constant [25 x i8] c"kotlin/reflect/KFunction\00", align 1
@.tmr.1111 = private unnamed_addr constant [31 x i8] c"kotlin/reflect/KParameter$Kind\00", align 1
@.tmr.1112 = private unnamed_addr constant [26 x i8] c"kotlin/reflect/KParameter\00", align 1
@.tmr.1113 = private unnamed_addr constant [21 x i8] c"kotlin/reflect/KType\00", align 1
@.tmr.1114 = private unnamed_addr constant [30 x i8] c"kotlin/reflect/KTypeParameter\00", align 1
@.tmr.1115 = private unnamed_addr constant [31 x i8] c"kotlin/reflect/KTypeProjection\00", align 1
@.tmr.1116 = private unnamed_addr constant [41 x i8] c"kotlin/reflect/KTypeProjection$Companion\00", align 1
@.tmr.1117 = private unnamed_addr constant [25 x i8] c"kotlin/reflect/KVariance\00", align 1
@.tmr.1118 = private unnamed_addr constant [27 x i8] c"kotlin/reflect/KVisibility\00", align 1
@.tmr.1119 = private unnamed_addr constant [42 x i8] c"kotlin/jvm/internal/markers/KMappedMarker\00", align 1
@.tmr.1120 = private unnamed_addr constant [31 x i8] c"kotlin/jvm/functions/Function0\00", align 1
@.tmr.1121 = private unnamed_addr constant [31 x i8] c"kotlin/jvm/functions/Function1\00", align 1
@.tmr.1122 = private unnamed_addr constant [31 x i8] c"kotlin/jvm/functions/Function2\00", align 1
@.tmr.1123 = private unnamed_addr constant [25 x i8] c"kotlin/enums/EnumEntries\00", align 1
@.tmr.1124 = private unnamed_addr constant [31 x i8] c"kotlin/coroutines/Continuation\00", align 1
@.tmr.1125 = private unnamed_addr constant [39 x i8] c"kotlin/coroutines/CoroutineContext$Key\00", align 1
@.tmr.1126 = private unnamed_addr constant [35 x i8] c"kotlin/coroutines/CoroutineContext\00", align 1
@.tmr.1127 = private unnamed_addr constant [38 x i8] c"androidx/viewpager2/widget/ViewPager2\00", align 1
@.tmr.1128 = private unnamed_addr constant [59 x i8] c"androidx/viewpager2/widget/ViewPager2$OnPageChangeCallback\00", align 1
@.tmr.1129 = private unnamed_addr constant [54 x i8] c"androidx/viewpager2/widget/ViewPager2$PageTransformer\00", align 1
@.tmr.1130 = private unnamed_addr constant [49 x i8] c"androidx/viewpager2/adapter/FragmentStateAdapter\00", align 1
@.tmr.1131 = private unnamed_addr constant [77 x i8] c"androidx/viewpager2/adapter/FragmentStateAdapter$FragmentTransactionCallback\00", align 1
@.tmr.1132 = private unnamed_addr constant [97 x i8] c"androidx/viewpager2/adapter/FragmentStateAdapter$FragmentTransactionCallback$OnPostEventListener\00", align 1
@.tmr.1133 = private unnamed_addr constant [47 x i8] c"androidx/viewpager2/adapter/FragmentViewHolder\00", align 1
@.tmr.1134 = private unnamed_addr constant [42 x i8] c"androidx/drawerlayout/widget/DrawerLayout\00", align 1
@.tmr.1135 = private unnamed_addr constant [57 x i8] c"androidx/drawerlayout/widget/DrawerLayout$DrawerListener\00", align 1
@.tmr.1136 = private unnamed_addr constant [73 x i8] c"mono/androidx/drawerlayout/widget/DrawerLayout_DrawerListenerImplementor\00", align 1
@.tmr.1137 = private unnamed_addr constant [55 x i8] c"androidx/drawerlayout/widget/DrawerLayout$LayoutParams\00", align 1
@.tmr.1138 = private unnamed_addr constant [20 x i8] c"[Ljava/lang/Object;\00", align 1
@.tmr.1139 = private unnamed_addr constant [3 x i8] c"[Z\00", align 1
@.tmr.1140 = private unnamed_addr constant [3 x i8] c"[B\00", align 1
@.tmr.1141 = private unnamed_addr constant [3 x i8] c"[C\00", align 1
@.tmr.1142 = private unnamed_addr constant [3 x i8] c"[S\00", align 1
@.tmr.1143 = private unnamed_addr constant [3 x i8] c"[I\00", align 1
@.tmr.1144 = private unnamed_addr constant [3 x i8] c"[J\00", align 1
@.tmr.1145 = private unnamed_addr constant [3 x i8] c"[F\00", align 1
@.tmr.1146 = private unnamed_addr constant [3 x i8] c"[D\00", align 1
@.tmr.1147 = private unnamed_addr constant [37 x i8] c"net/dot/jni/internal/JavaProxyObject\00", align 1
@.tmr.1148 = private unnamed_addr constant [40 x i8] c"net/dot/jni/internal/JavaProxyThrowable\00", align 1
@.tmr.1149 = private unnamed_addr constant [24 x i8] c"net/dot/jni/ManagedPeer\00", align 1

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [26 x i8] c"Xamarin.AndroidX.Activity\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [32 x i8] c"Xamarin.Google.Android.Material\00", align 1
@.TypeMapModule.2_assembly_name = private unnamed_addr constant [37 x i8] c"Xamarin.AndroidX.Navigation.Fragment\00", align 1
@.TypeMapModule.3_assembly_name = private unnamed_addr constant [22 x i8] c"Xamarin.AndroidX.Core\00", align 1
@.TypeMapModule.4_assembly_name = private unnamed_addr constant [43 x i8] c"Xamarin.AndroidX.Navigation.Common.Android\00", align 1
@.TypeMapModule.5_assembly_name = private unnamed_addr constant [36 x i8] c"Xamarin.AndroidX.SwipeRefreshLayout\00", align 1
@.TypeMapModule.6_assembly_name = private unnamed_addr constant [31 x i8] c"Xamarin.AndroidX.Navigation.UI\00", align 1
@.TypeMapModule.7_assembly_name = private unnamed_addr constant [24 x i8] c"Microsoft.Maui.Graphics\00", align 1
@.TypeMapModule.8_assembly_name = private unnamed_addr constant [31 x i8] c"Xamarin.AndroidX.CursorAdapter\00", align 1
@.TypeMapModule.9_assembly_name = private unnamed_addr constant [45 x i8] c"Xamarin.AndroidX.Lifecycle.ViewModel.Android\00", align 1
@.TypeMapModule.10_assembly_name = private unnamed_addr constant [26 x i8] c"Xamarin.AndroidX.CardView\00", align 1
@.TypeMapModule.11_assembly_name = private unnamed_addr constant [15 x i8] c"Microsoft.Maui\00", align 1
@.TypeMapModule.12_assembly_name = private unnamed_addr constant [24 x i8] c"Xamarin.AndroidX.Loader\00", align 1
@.TypeMapModule.13_assembly_name = private unnamed_addr constant [41 x i8] c"Xamarin.AndroidX.Lifecycle.LiveData.Core\00", align 1
@.TypeMapModule.14_assembly_name = private unnamed_addr constant [44 x i8] c"Xamarin.AndroidX.Navigation.Runtime.Android\00", align 1
@.TypeMapModule.15_assembly_name = private unnamed_addr constant [28 x i8] c"Xamarin.AndroidX.CustomView\00", align 1
@.TypeMapModule.16_assembly_name = private unnamed_addr constant [35 x i8] c"Xamarin.Google.Crypto.Tink.Android\00", align 1
@.TypeMapModule.17_assembly_name = private unnamed_addr constant [24 x i8] c"Microsoft.Maui.Controls\00", align 1
@.TypeMapModule.18_assembly_name = private unnamed_addr constant [27 x i8] c"Xamarin.AndroidX.AppCompat\00", align 1
@.TypeMapModule.19_assembly_name = private unnamed_addr constant [11 x i8] c"teamup_mmu\00", align 1
@.TypeMapModule.20_assembly_name = private unnamed_addr constant [27 x i8] c"Xamarin.AndroidX.ViewPager\00", align 1
@.TypeMapModule.21_assembly_name = private unnamed_addr constant [26 x i8] c"Microsoft.Maui.Essentials\00", align 1
@.TypeMapModule.22_assembly_name = private unnamed_addr constant [35 x i8] c"Xamarin.AndroidX.CoordinatorLayout\00", align 1
@.TypeMapModule.23_assembly_name = private unnamed_addr constant [38 x i8] c"Xamarin.AndroidX.Lifecycle.Common.Jvm\00", align 1
@.TypeMapModule.24_assembly_name = private unnamed_addr constant [36 x i8] c"Xamarin.KotlinX.Coroutines.Core.Jvm\00", align 1
@.TypeMapModule.25_assembly_name = private unnamed_addr constant [39 x i8] c"Xamarin.KotlinX.Serialization.Core.Jvm\00", align 1
@.TypeMapModule.26_assembly_name = private unnamed_addr constant [41 x i8] c"Xamarin.AndroidX.Security.SecurityCrypto\00", align 1
@.TypeMapModule.27_assembly_name = private unnamed_addr constant [55 x i8] c"Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android\00", align 1
@.TypeMapModule.28_assembly_name = private unnamed_addr constant [32 x i8] c"Xamarin.AndroidX.Collection.Jvm\00", align 1
@.TypeMapModule.29_assembly_name = private unnamed_addr constant [30 x i8] c"Xamarin.AndroidX.RecyclerView\00", align 1
@.TypeMapModule.30_assembly_name = private unnamed_addr constant [26 x i8] c"Xamarin.AndroidX.Fragment\00", align 1
@.TypeMapModule.31_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1
@.TypeMapModule.32_assembly_name = private unnamed_addr constant [47 x i8] c"Xamarin.AndroidX.SavedState.SavedState.Android\00", align 1
@.TypeMapModule.33_assembly_name = private unnamed_addr constant [46 x i8] c"Xamarin.AndroidX.AppCompat.AppCompatResources\00", align 1
@.TypeMapModule.34_assembly_name = private unnamed_addr constant [22 x i8] c"Xamarin.Kotlin.StdLib\00", align 1
@.TypeMapModule.35_assembly_name = private unnamed_addr constant [28 x i8] c"Xamarin.AndroidX.ViewPager2\00", align 1
@.TypeMapModule.36_assembly_name = private unnamed_addr constant [30 x i8] c"Xamarin.AndroidX.DrawerLayout\00", align 1
@.TypeMapModule.37_assembly_name = private unnamed_addr constant [13 x i8] c"Java.Interop\00", align 1

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ 350a375fc202f0072ac4191624986d8c642b93fa"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
