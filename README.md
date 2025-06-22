# Homework

## 📱 프로젝트 소개

SwiftUI 기반으로 구현된 상품 리스트 및 상세 화면 앱입니다.  
상품 데이터를 리스트 형태로 제공하며, 상품 클릭 시 WKWebView를 통해 상세 페이지를 표시합니다.  

## 🧩 프로젝트 구조

본 프로젝트는 기능 분리를 명확히 하고, 의존성을 관리하기 위해 Swift Package Manager(SPM) 기반의 모듈 구조를 채택했습니다.

- `App`: 앱 실행 진입점. Feature 모듈들을 조합하여 실제 UI 흐름을 구성
- `Features/*`: 각각 독립적인 화면 기능 단위로 구성. Clean Architecture 기반 Presentation, Domain, Data 계층 구성
- `Common/*`: 여러 Feature에서 공통으로 사용하는 도메인 Entity, UI 컴포넌트, 공통 비즈니스 로직 등을 포함
- `Core/*`: DI, Networking, Logging 등 Infrastructure 관련 기능 담당
- `Shared/*`: 디자인 시스템, 유틸 등 전 영역에서 활용 가능한 범용 도구

```
App
├── AppCoodrinator
├── AppDelegate
├── SceneDelegate
Modules
├── Features
│   ├── ProductDetail
│   │   ├── Data
│   │   ├── Domain
│   │   ├── Presentation
│   │   └── ProductDetail
│   └── ProductList
│       ├── Data
│       ├── Domain
│       ├── Presentation
│       └── ProductList
├── Common
│   ├── Entity
│   └── UI
├── Core
│   ├── DI
│   ├── Logging
│   └── Networking
└── Shared
    ├── DesignSystem
    └── Utils
```

## 🛠 사용 기술 / 패턴 / 라이브러리

- SwiftUI
- Swift Concurrency
- WKWebView
- Alamofire
- Kingfisher
- Swinject
- XCTest
- Clean Architecture
- SPM Modular Architecture

## 🖼 주요 기능

### 상품 리스트 화면 (ProductList)

- SwiftUI `List`와 `HStack`을 활용한 2열 카드 UI
- 상품명, 가격, 할인 가격, 할인율, 브랜드명, 썸네일 이미지, 혜택 등 표시
- 초기 로딩 화면 대응을 위한 Skeleton UI 적용
- 상품 클릭 시 상세 페이지로 이동

### 상품 상세 화면 (ProductDetail)

- 상품의 상세 URL을 WKWebView로 로딩
- `WebViewConfiguration`, `WebViewMessageHandler`, `ProductDetailViewModel` 등으로 기능 분리
- JavaScript → native 메시지 수신 구조 포함

## 🧠 접근 방식 및 고려사항

- 상품 데이터는 `products.json` 파일로 구성되며, `Bundle.module`을 통해 로딩
- `Core/Networking`은 실제 네트워크 요청 처리를 위한 infra 모듈로 정의
- 사전 정의된 JS-native 인터페이스 없이, DOM 요소에 이벤트 리스너를 주입해 enum 기반 메시지로 native에 전달하는 통신 구조를 구현

## ⚙️ 빌드 및 실행 방법

1. 이 저장소를 클론합니다.
2. `Homework` 타겟을 실행하세요.

> ⚠️ 사전 조건: Xcode 14+, iOS 14+, Swift Package Manager

## 🧪 테스트

- `ProductListDataSourceMockImpl`를 통한 목 JSON (`products.json`) 기반 유닛 테스트 가능

## ⏱ 개발 소요 시간

약 **7시간** 소요되었습니다.

