# Closetok

가까운 사이, 우리만 아는 SNS

## Change Log

### 24.04.20
- 회원가입 화면 구현
    - 로그인화면으로 네비게이션
    - 이름 화면 구현
    - 이메일 화면 구현
    - 비밀번호 화면 구현
- 로그인화면 구현

### 24.04.19
- Initialize
- 패키지 설치
    - [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
    - shared_preferences
    - provider
    - flutter_riverpod
    - [google_fonts](https://pub.dev/packages/google_fonts)
        ```
        google_fonts_base.dart:69:8: 
        Error: 'FontFeature' isn't a type.
        ```
        에러날 경우 google_fonts 패키지 버전 6.1.0으로 다운그레이드
    - [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)
- constants 정의
- Router 셋팅
    - go_router
- i18n 셋팅
    - [intl](https://pub.dev/packages/intl)
- google ads 셋팅
    - google_mobile_ads
- 회원가입 화면 구현
