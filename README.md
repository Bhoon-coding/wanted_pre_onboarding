# wanted_pre_onboarding
원티드 프리온보딩 사전과제 (날씨앱)
<br><br>

## 👀 미리보기
|**메인**|**날씨상세**|
|------|---|
|<img width="200" alt="스크린샷 2022-06-15 오후 2 13 23" src="https://user-images.githubusercontent.com/64088377/173754009-bc5ed809-1ca8-4d7b-8ec5-9ae7910045ef.png">|<img width="200" alt="스크린샷 2022-06-15 오후 2 08 48" src="https://user-images.githubusercontent.com/64088377/173754025-5a3a876b-e95f-4d04-9a12-f89882b63f69.png">|

<br>

## Version Target 
- iOS 13.0

<br>

## 💻 개발도구
<img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white">  <img src="https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white">

<br>

## 기능

### 메인

`URLSession`
- iOS 앱에서 네트워킹을 하기 위해 URLSession을 사용 (HTTP 프로토콜을 이용하여 데이터를 주고받음.)
- [openweathermap](https://openweathermap.org/current#builtin:~:text=https%3A//api.openweathermap.org/data/2.5/weather%3Fq%3D%7Bcity%20name%7D%26appid%3D%7BAPI%20key%7D) 해당 링크의 API 호출

<br>

`CollectionView`
- 받아온 데이터를 CollectionView에 담아 보여줌

<br>

`GCD` 
- DispatchGroup을 사용하여 도시 이름마다 API를 호출 후 받아온 데이터를 빈 배열에 다 저장하면 아래 작업 실행

  - CollectionView realodData
  - Activity Indicator off
  
<br>

`Cache`
- 받아온 데이터를 일시적으로 저장하여 CollectionView에서 스크롤시 데이터를 다시 받아오던 작업 개선

<br>

### 날씨상세페이지

`데이터전달`
- 메인페이지에 저장된 데이터를 날씨상세페이지(WeatherDetailVC)의 인자로 전달 

<br>

`StackView`
- 하단 `기압`, `풍속`, `습도` 를 나란히 보여주기 위해 StackView 사용

-----
## Git Branch

`<Prefix>/BSTS-#<issue_number>-<구현내용>` 의 양식에 따라 브랜치 명을 작성합니다.


### 1. prefix
- `main`: 개발이 완료되어 최종 배포될 브랜치
- `develop`: default branch - feature, bugfix등 구현된 기능들이 merge된 후 main에 merge 되기 전 관리될 브랜치
- `feature`: 기능을 개발하는 브랜치
- `bugfix`: 버그를 수정하는 브랜치

### ⚠️ 참고
- 띄어쓰기 부분은 '-' 을 사용합니다.
- branch 내용은 '소문자 영어'로만 작성합니다.


### 예시

``` swift
bugfix/PREON-#12-add-menu-button-not-working
feature/PREON-#50-remote-notification
```

## Commit Message Convention

### 1. 기본 형식
```swift
// 아래 구분마다 띄워쓰기 해주며, [이슈내용] 부분에 띄어쓰기시 그대로 띄워줍니다.
[prefix] #이슈번호 - [이슈내용]

```

### 2. 예시

```swift
[feature] #43 - remote notification
```
## Code Convention 
https://github.com/StyleShare/swift-style-guide 을 최대한 따르고 있습니다.
