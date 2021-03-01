import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/authentication/providers/auth_provider.dart';
import '../../features/secret_code/providers/secret_code_provider.dart';
import '../../features/user_details/providers/user_details_provider.dart';

final globalAuthProvider =
    ChangeNotifierProvider((ref) => AuthenticationProvider());
final globalSecretCodeProvider =
    ChangeNotifierProvider((ref) => SecretCodeProvider());
final globalUserDetailsProvider =
    ChangeNotifierProvider((ref) => UserDetailsProvider());
