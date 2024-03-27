
import 'package:easy_cart/feature/auth/data/source/auth_remote_source.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:supabase/supabase.dart';

void main() {
  late AuthRemoteDataSource authRemoteDataSource;

  setUp(() {
    authRemoteDataSource = AuthRemoteDataSource(supabaseClient: FakeSupabase());
  });
  test('Fake Supabase', () async {
    final supabase = FakeSupabase();

    final response = await supabase.auth.signInWithPassword(
      email: 'test@gmail.com',
      password: 'passsword',
    );
    expect(response.session, isA<Session>());
  });

  test('Auth Remote Data source', () async {
    final user = await authRemoteDataSource.loginWithEmail(
        email: 'test@test.com', password: 'password');

    expect(user.email, '');
  });
}

class FakeSupabase extends Fake implements SupabaseClient {
  @override
  get auth => FakeGotrue();
}

class FakeGotrue extends Fake implements GoTrueClient {
  final _user = User(
    id: 'id',
    appMetadata: {},
    userMetadata: {},
    aud: 'aud',
    createdAt: DateTime.now().toIso8601String(),
  );
  @override
  Future<AuthResponse> signInWithPassword(
      {String? email,
      String? phone,
      required String password,
      String? captchaToken}) async {
    return AuthResponse(
      session: Session(
        accessToken: '',
        tokenType: '',
        user: _user,
      ),
      user: _user,
    );
  }
}
