; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [127 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [254 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 39109920, ; 1: Newtonsoft.Json.dll => 0x254c520 => 48
	i32 42244203, ; 2: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 117
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 5: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 83839681, ; 6: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 108
	i32 136584136, ; 8: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 9: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 10: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 53
	i32 182336117, ; 11: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 71
	i32 205061960, ; 12: System.ComponentModel => 0xc38ff48 => 85
	i32 230752869, ; 13: Microsoft.CSharp.dll => 0xdc10265 => 78
	i32 246610117, ; 14: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 106
	i32 317674968, ; 15: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 16: Xamarin.AndroidX.Activity.dll => 0x13031348 => 49
	i32 321963286, ; 17: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 18: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 60
	i32 379916513, ; 19: System.Threading.Thread.dll => 0x16a510e1 => 117
	i32 385762202, ; 20: System.Memory.dll => 0x16fe439a => 96
	i32 395744057, ; 21: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 22: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 23: System.Collections => 0x1a61054f => 82
	i32 450948140, ; 24: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 59
	i32 459347974, ; 25: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 469710990, ; 26: System.dll => 0x1bff388e => 122
	i32 489220957, ; 27: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 28: System.ObjectModel => 0x1dbae811 => 101
	i32 513247710, ; 29: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 42
	i32 538707440, ; 30: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 31: Microsoft.Extensions.Logging => 0x20216150 => 39
	i32 627609679, ; 32: Xamarin.AndroidX.CustomView => 0x2568904f => 57
	i32 627931235, ; 33: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 34: System.Collections.Concurrent => 0x2814a96c => 79
	i32 690569205, ; 35: System.Xml.Linq.dll => 0x29293ff5 => 119
	i32 722857257, ; 36: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 759454413, ; 37: System.Net.Requests => 0x2d445acd => 99
	i32 775507847, ; 38: System.IO.Compression => 0x2e394f87 => 93
	i32 777317022, ; 39: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 40: Microsoft.Extensions.Options => 0x2f0980eb => 41
	i32 804715423, ; 41: System.Data.Common => 0x2ff6fb9f => 87
	i32 823281589, ; 42: System.Private.Uri.dll => 0x311247b5 => 102
	i32 830298997, ; 43: System.IO.Compression.Brotli => 0x317d5b75 => 92
	i32 869139383, ; 44: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 45: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 46: System.ComponentModel.Primitives.dll => 0x35e25008 => 83
	i32 918734561, ; 47: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 955402788, ; 48: Newtonsoft.Json => 0x38f24a24 => 48
	i32 961460050, ; 49: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 50: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 60
	i32 975874589, ; 51: System.Xml.XDocument => 0x3a2aaa1d => 121
	i32 990727110, ; 52: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 53: System.Collections.dll => 0x3b2c715c => 82
	i32 1012816738, ; 54: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 70
	i32 1019214401, ; 55: System.Drawing => 0x3cbffa41 => 91
	i32 1028951442, ; 56: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 38
	i32 1035644815, ; 57: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 50
	i32 1036536393, ; 58: System.Drawing.Primitives.dll => 0x3dc84a49 => 90
	i32 1043950537, ; 59: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 60: System.Linq.Expressions.dll => 0x3e444eb4 => 94
	i32 1052210849, ; 61: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 62
	i32 1082857460, ; 62: System.ComponentModel.TypeConverter => 0x408b17f4 => 84
	i32 1084122840, ; 63: Xamarin.Kotlin.StdLib => 0x409e66d8 => 75
	i32 1098259244, ; 64: System => 0x41761b2c => 122
	i32 1108272742, ; 65: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 66: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 67: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 68: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 69: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 67
	i32 1260983243, ; 70: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 71: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 58
	i32 1308624726, ; 72: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 73: System.Linq => 0x4eed2679 => 95
	i32 1336711579, ; 74: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 75: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 76: Xamarin.AndroidX.SavedState => 0x52114ed3 => 70
	i32 1406073936, ; 77: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 54
	i32 1408764838, ; 78: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1430672901, ; 79: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 80: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 81: System.IO.Compression.dll => 0x57261233 => 93
	i32 1469204771, ; 82: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 51
	i32 1470490898, ; 83: Microsoft.Extensions.Primitives => 0x57a5e912 => 42
	i32 1480492111, ; 84: System.IO.Compression.Brotli.dll => 0x583e844f => 92
	i32 1526286932, ; 85: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 86: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 116
	i32 1622152042, ; 87: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 64
	i32 1624863272, ; 88: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 73
	i32 1636350590, ; 89: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 56
	i32 1639515021, ; 90: System.Net.Http.dll => 0x61b9038d => 97
	i32 1639986890, ; 91: System.Text.RegularExpressions => 0x61c036ca => 116
	i32 1657153582, ; 92: System.Runtime => 0x62c6282e => 113
	i32 1658251792, ; 93: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 74
	i32 1677501392, ; 94: System.Net.Primitives.dll => 0x63fca3d0 => 98
	i32 1679769178, ; 95: System.Security.Cryptography => 0x641f3e5a => 114
	i32 1729485958, ; 96: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 52
	i32 1743415430, ; 97: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 98: System.Diagnostics.TraceSource.dll => 0x69239124 => 89
	i32 1766324549, ; 99: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 71
	i32 1770582343, ; 100: Microsoft.Extensions.Logging.dll => 0x6988f147 => 39
	i32 1780572499, ; 101: Mono.Android.Runtime.dll => 0x6a216153 => 125
	i32 1782862114, ; 102: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 103: Xamarin.AndroidX.Fragment => 0x6a96652d => 59
	i32 1793755602, ; 104: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 105: Xamarin.AndroidX.Loader => 0x6bcd3296 => 64
	i32 1813058853, ; 106: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 75
	i32 1813201214, ; 107: Xamarin.Google.Android.Material => 0x6c13413e => 74
	i32 1818569960, ; 108: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 68
	i32 1824175904, ; 109: System.Text.Encoding.Extensions => 0x6cbab720 => 115
	i32 1824722060, ; 110: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 111: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1853025655, ; 112: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 113: System.Linq.Expressions => 0x6ec71a65 => 94
	i32 1870277092, ; 114: System.Reflection.Primitives => 0x6f7a29e4 => 107
	i32 1875935024, ; 115: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 116: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 117: System.Collections.NonGeneric.dll => 0x71dc7c8b => 80
	i32 1939592360, ; 118: System.Private.Xml.Linq => 0x739bd4a8 => 103
	i32 1953182387, ; 119: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 120: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 35
	i32 2003115576, ; 121: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 122: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 62
	i32 2045470958, ; 123: System.Private.Xml => 0x79eb68ee => 104
	i32 2055257422, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 61
	i32 2066184531, ; 125: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 126: System.Diagnostics.TraceSource => 0x7b6f419e => 89
	i32 2079903147, ; 127: System.Runtime.dll => 0x7bf8cdab => 113
	i32 2090596640, ; 128: System.Numerics.Vectors => 0x7c9bf920 => 100
	i32 2127167465, ; 129: System.Console => 0x7ec9ffe9 => 86
	i32 2142473426, ; 130: System.Collections.Specialized => 0x7fb38cd2 => 81
	i32 2159891885, ; 131: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 132: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 133: Microsoft.Extensions.Options.dll => 0x820d22b3 => 41
	i32 2192057212, ; 134: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 135: System.ObjectModel.dll => 0x82b6c85e => 101
	i32 2201107256, ; 136: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 76
	i32 2201231467, ; 137: System.Net.Http => 0x8334206b => 97
	i32 2207618523, ; 138: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 139: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 36
	i32 2279755925, ; 140: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 69
	i32 2303942373, ; 141: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 142: System.Private.CoreLib.dll => 0x896b7878 => 123
	i32 2305642578, ; 143: notes_app_maui => 0x896d5052 => 77
	i32 2353062107, ; 144: System.Net.Primitives => 0x8c40e0db => 98
	i32 2366048013, ; 145: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 146: System.Xml.ReaderWriter.dll => 0x8d24e767 => 120
	i32 2371007202, ; 147: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 35
	i32 2395872292, ; 148: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2396540766, ; 149: notes_app_maui.dll => 0x8ed84f5e => 77
	i32 2427813419, ; 150: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 151: System.Console.dll => 0x912896e5 => 86
	i32 2475788418, ; 152: Java.Interop.dll => 0x93918882 => 124
	i32 2480646305, ; 153: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2503351294, ; 154: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2538310050, ; 155: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 106
	i32 2550873716, ; 156: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 157: Microsoft.CSharp => 0x98ba5a04 => 78
	i32 2576534780, ; 158: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2585220780, ; 159: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 115
	i32 2593496499, ; 160: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 161: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 76
	i32 2617129537, ; 162: System.Private.Xml.dll => 0x9bfe3a41 => 104
	i32 2620871830, ; 163: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 56
	i32 2626831493, ; 164: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 165: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 166: System.Xml.XDocument.dll => 0x9ecf752a => 121
	i32 2665622720, ; 167: System.Drawing.Primitives => 0x9ee22cc0 => 90
	i32 2676780864, ; 168: System.Data.Common.dll => 0x9f8c6f40 => 87
	i32 2724373263, ; 169: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 170: Xamarin.AndroidX.Activity => 0xa2e0939b => 49
	i32 2737747696, ; 171: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 51
	i32 2740698338, ; 172: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 173: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 174: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 175: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2778768386, ; 176: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 72
	i32 2785988530, ; 177: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 178: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2810250172, ; 179: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 54
	i32 2853208004, ; 180: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 72
	i32 2861189240, ; 181: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 182: System.Private.CoreLib => 0xad6f1e8a => 123
	i32 2916838712, ; 183: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 73
	i32 2919462931, ; 184: System.Numerics.Vectors.dll => 0xae037813 => 100
	i32 2959614098, ; 185: System.ComponentModel.dll => 0xb0682092 => 85
	i32 2978675010, ; 186: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 58
	i32 3038032645, ; 187: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 188: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 189: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 65
	i32 3059408633, ; 190: Mono.Android.Runtime => 0xb65adef9 => 125
	i32 3059793426, ; 191: System.ComponentModel.Primitives => 0xb660be12 => 83
	i32 3159123045, ; 192: System.Reflection.Primitives.dll => 0xbc4c6465 => 107
	i32 3178803400, ; 193: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 66
	i32 3220365878, ; 194: System.Threading => 0xbff2e236 => 118
	i32 3258312781, ; 195: Xamarin.AndroidX.CardView => 0xc235e84d => 52
	i32 3305363605, ; 196: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 197: System.Net.Requests.dll => 0xc5b097e4 => 99
	i32 3317135071, ; 198: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 57
	i32 3346324047, ; 199: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 67
	i32 3357674450, ; 200: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 201: Xamarin.AndroidX.Core => 0xc86c06e3 => 55
	i32 3366347497, ; 202: Java.Interop => 0xc8a662e9 => 124
	i32 3374999561, ; 203: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 69
	i32 3381016424, ; 204: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 205: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 37
	i32 3458724246, ; 206: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 207: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 84
	i32 3476120550, ; 208: Mono.Android => 0xcf3163e6 => 126
	i32 3484440000, ; 209: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3509114376, ; 210: System.Xml.Linq => 0xd128d608 => 119
	i32 3580758918, ; 211: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 212: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 213: System.Linq.dll => 0xd715a361 => 95
	i32 3641597786, ; 214: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 61
	i32 3643446276, ; 215: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 216: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 66
	i32 3657292374, ; 217: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 36
	i32 3672681054, ; 218: Mono.Android.dll => 0xdae8aa5e => 126
	i32 3724971120, ; 219: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 65
	i32 3748608112, ; 220: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 88
	i32 3751619990, ; 221: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 222: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 53
	i32 3792276235, ; 223: System.Collections.NonGeneric => 0xe2098b0b => 80
	i32 3802395368, ; 224: System.Collections.Specialized.dll => 0xe2a3f2e8 => 81
	i32 3823082795, ; 225: System.Security.Cryptography.dll => 0xe3df9d2b => 114
	i32 3841636137, ; 226: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 38
	i32 3849253459, ; 227: System.Runtime.InteropServices.dll => 0xe56ef253 => 108
	i32 3896106733, ; 228: System.Collections.Concurrent.dll => 0xe839deed => 79
	i32 3896760992, ; 229: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 55
	i32 3920221145, ; 230: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 231: System.Xml.ReaderWriter => 0xea213423 => 120
	i32 3931092270, ; 232: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 68
	i32 3955647286, ; 233: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 50
	i32 4025784931, ; 234: System.Memory => 0xeff49a63 => 96
	i32 4046471985, ; 235: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4054681211, ; 236: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 105
	i32 4068434129, ; 237: System.Private.Xml.Linq.dll => 0xf27f60d1 => 103
	i32 4073602200, ; 238: System.Threading.dll => 0xf2ce3c98 => 118
	i32 4091086043, ; 239: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 240: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4099507663, ; 241: System.Drawing.dll => 0xf45985cf => 91
	i32 4100113165, ; 242: System.Private.Uri => 0xf462c30d => 102
	i32 4103439459, ; 243: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 244: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 37
	i32 4147896353, ; 245: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 105
	i32 4150914736, ; 246: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 247: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 248: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 63
	i32 4213026141, ; 249: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 88
	i32 4249188766, ; 250: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 251: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4274976490, ; 252: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959 ; 253: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 63
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [254 x i32] [
	i32 0, ; 0
	i32 48, ; 1
	i32 9, ; 2
	i32 117, ; 3
	i32 33, ; 4
	i32 47, ; 5
	i32 17, ; 6
	i32 108, ; 7
	i32 32, ; 8
	i32 25, ; 9
	i32 53, ; 10
	i32 71, ; 11
	i32 85, ; 12
	i32 78, ; 13
	i32 106, ; 14
	i32 30, ; 15
	i32 49, ; 16
	i32 8, ; 17
	i32 60, ; 18
	i32 117, ; 19
	i32 96, ; 20
	i32 34, ; 21
	i32 28, ; 22
	i32 82, ; 23
	i32 59, ; 24
	i32 112, ; 25
	i32 122, ; 26
	i32 6, ; 27
	i32 101, ; 28
	i32 42, ; 29
	i32 27, ; 30
	i32 39, ; 31
	i32 57, ; 32
	i32 19, ; 33
	i32 79, ; 34
	i32 119, ; 35
	i32 109, ; 36
	i32 99, ; 37
	i32 93, ; 38
	i32 25, ; 39
	i32 41, ; 40
	i32 87, ; 41
	i32 102, ; 42
	i32 92, ; 43
	i32 10, ; 44
	i32 24, ; 45
	i32 83, ; 46
	i32 21, ; 47
	i32 48, ; 48
	i32 14, ; 49
	i32 60, ; 50
	i32 121, ; 51
	i32 23, ; 52
	i32 82, ; 53
	i32 70, ; 54
	i32 91, ; 55
	i32 38, ; 56
	i32 50, ; 57
	i32 90, ; 58
	i32 4, ; 59
	i32 94, ; 60
	i32 62, ; 61
	i32 84, ; 62
	i32 75, ; 63
	i32 122, ; 64
	i32 26, ; 65
	i32 20, ; 66
	i32 16, ; 67
	i32 22, ; 68
	i32 67, ; 69
	i32 2, ; 70
	i32 58, ; 71
	i32 11, ; 72
	i32 95, ; 73
	i32 31, ; 74
	i32 32, ; 75
	i32 70, ; 76
	i32 54, ; 77
	i32 111, ; 78
	i32 0, ; 79
	i32 6, ; 80
	i32 93, ; 81
	i32 51, ; 82
	i32 42, ; 83
	i32 92, ; 84
	i32 30, ; 85
	i32 116, ; 86
	i32 64, ; 87
	i32 73, ; 88
	i32 56, ; 89
	i32 97, ; 90
	i32 116, ; 91
	i32 113, ; 92
	i32 74, ; 93
	i32 98, ; 94
	i32 114, ; 95
	i32 52, ; 96
	i32 1, ; 97
	i32 89, ; 98
	i32 71, ; 99
	i32 39, ; 100
	i32 125, ; 101
	i32 17, ; 102
	i32 59, ; 103
	i32 9, ; 104
	i32 64, ; 105
	i32 75, ; 106
	i32 74, ; 107
	i32 68, ; 108
	i32 115, ; 109
	i32 111, ; 110
	i32 40, ; 111
	i32 26, ; 112
	i32 94, ; 113
	i32 107, ; 114
	i32 8, ; 115
	i32 2, ; 116
	i32 80, ; 117
	i32 103, ; 118
	i32 13, ; 119
	i32 35, ; 120
	i32 5, ; 121
	i32 62, ; 122
	i32 104, ; 123
	i32 61, ; 124
	i32 4, ; 125
	i32 89, ; 126
	i32 113, ; 127
	i32 100, ; 128
	i32 86, ; 129
	i32 81, ; 130
	i32 45, ; 131
	i32 12, ; 132
	i32 41, ; 133
	i32 40, ; 134
	i32 101, ; 135
	i32 76, ; 136
	i32 97, ; 137
	i32 14, ; 138
	i32 36, ; 139
	i32 69, ; 140
	i32 18, ; 141
	i32 123, ; 142
	i32 77, ; 143
	i32 98, ; 144
	i32 12, ; 145
	i32 120, ; 146
	i32 35, ; 147
	i32 13, ; 148
	i32 77, ; 149
	i32 10, ; 150
	i32 86, ; 151
	i32 124, ; 152
	i32 43, ; 153
	i32 16, ; 154
	i32 106, ; 155
	i32 11, ; 156
	i32 78, ; 157
	i32 15, ; 158
	i32 115, ; 159
	i32 20, ; 160
	i32 76, ; 161
	i32 104, ; 162
	i32 56, ; 163
	i32 15, ; 164
	i32 109, ; 165
	i32 121, ; 166
	i32 90, ; 167
	i32 87, ; 168
	i32 110, ; 169
	i32 49, ; 170
	i32 51, ; 171
	i32 1, ; 172
	i32 21, ; 173
	i32 44, ; 174
	i32 45, ; 175
	i32 72, ; 176
	i32 27, ; 177
	i32 47, ; 178
	i32 54, ; 179
	i32 72, ; 180
	i32 46, ; 181
	i32 123, ; 182
	i32 73, ; 183
	i32 100, ; 184
	i32 85, ; 185
	i32 58, ; 186
	i32 34, ; 187
	i32 7, ; 188
	i32 65, ; 189
	i32 125, ; 190
	i32 83, ; 191
	i32 107, ; 192
	i32 66, ; 193
	i32 118, ; 194
	i32 52, ; 195
	i32 7, ; 196
	i32 99, ; 197
	i32 57, ; 198
	i32 67, ; 199
	i32 24, ; 200
	i32 55, ; 201
	i32 124, ; 202
	i32 69, ; 203
	i32 3, ; 204
	i32 37, ; 205
	i32 22, ; 206
	i32 84, ; 207
	i32 126, ; 208
	i32 23, ; 209
	i32 119, ; 210
	i32 31, ; 211
	i32 33, ; 212
	i32 95, ; 213
	i32 61, ; 214
	i32 28, ; 215
	i32 66, ; 216
	i32 36, ; 217
	i32 126, ; 218
	i32 65, ; 219
	i32 88, ; 220
	i32 3, ; 221
	i32 53, ; 222
	i32 80, ; 223
	i32 81, ; 224
	i32 114, ; 225
	i32 38, ; 226
	i32 108, ; 227
	i32 79, ; 228
	i32 55, ; 229
	i32 19, ; 230
	i32 120, ; 231
	i32 68, ; 232
	i32 50, ; 233
	i32 96, ; 234
	i32 44, ; 235
	i32 105, ; 236
	i32 103, ; 237
	i32 118, ; 238
	i32 5, ; 239
	i32 46, ; 240
	i32 91, ; 241
	i32 102, ; 242
	i32 29, ; 243
	i32 37, ; 244
	i32 105, ; 245
	i32 29, ; 246
	i32 112, ; 247
	i32 63, ; 248
	i32 88, ; 249
	i32 18, ; 250
	i32 43, ; 251
	i32 110, ; 252
	i32 63 ; 253
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
