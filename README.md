# ItemScrollView

[English](https://github.com/wlxo0401/ItemHorizontalScroll/blob/main/README_ENG.md)

## 개요

ItemScrollView는 iOS 애플리케이션을 위한 맞춤 설정 가능한 수평 스크롤 컴포넌트로, Swift와 UIKit(SnapKit)을 사용하여 구축되었습니다. 스크롤 가능하고 선택 가능한 항목들을 부드러운 애니메이션과 델리게이션 지원으로 쉽게 만들 수 있는 인터페이스를 제공합니다.

<img src="https://github.com/wlxo0401/ItemHorizontalScroll/blob/main/SimulatorScreenRecording.gif" width="300" alt="ItemScrollView 데모">

## 주요 기능

- 맞춤 설정 가능한 항목들로 구성된 수평 스크롤
- 선택된 항목에 대한 부드러운 밑줄 애니메이션
- 기존 UIKit 프로젝트와 쉬운 통합
- ItemStackView를 통한 유연한 항목 관리
- 항목 선택을 처리하기 위한 델리게이트 패턴

## 요구 사항

- iOS 11.0+
- Swift 5.0+
- Xcode 12.0+
- 자동 레이아웃을 위한 [SnapKit](https://github.com/SnapKit/SnapKit)

## 설치

프로젝트에서 ItemScrollView를 사용하려면 다음 파일들을 Xcode 프로젝트에 복사하기만 하면 됩니다:

- `ItemScrollView.swift`
- `ItemStackView.swift`
- `ItemView.swift`

SnapKit이 프로젝트에 설치되어 있는지 확인하세요. CocoaPods, Carthage, 또는 Swift Package Manager를 통해 설치할 수 있습니다.

## 사용법

다음은 ItemScrollView를 사용하는 간단한 예시입니다:

```swift
let scrollView = ItemScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
scrollView.setData(itemStrings: ["항목 1", "항목 2", "항목 3"], preSelectIndex: 0)
scrollView.itemScrollViewDelegate = self
view.addSubview(scrollView)
```

항목 선택을 처리하기 위해 `ItemScrollViewDelegate`를 구현하세요:

```swift
extension YourViewController: ItemScrollViewDelegate {
    func didSelectItem(at index: Int) {
        print("선택된 항목 인덱스: \(index)")
    }
}
```

## 커스터마이징

각 컴포넌트 클래스의 속성을 수정하여 ItemScrollView의 외관과 동작을 커스터마이징할 수 있습니다:

- `ItemScrollView`: 스크롤 뷰 속성 커스터마이징
- `ItemStackView`: 스택 뷰 레이아웃 및 밑줄 외관 조정
- `ItemView`: 개별 항목 외관 수정

## 코드 설명

ItemScrollView 컴포넌트는 세 가지 주요 부분으로 구성됩니다:

1. **ItemScrollView**: 수평 스크롤을 관리하고 항목 선택 이벤트를 위임하는 주 컨테이너입니다.

2. **ItemStackView**: 개별 항목들을 배열하고 선택된 항목에 대한 밑줄 표시기를 관리하는 사용자 정의 UIStackView입니다.

3. **ItemView**: 스크롤 뷰의 개별 항목을 나타내며, 항목 텍스트를 위한 레이블과 사용자 상호작용을 위한 버튼을 포함합니다.

이 컴포넌트들이 함께 작동하여 항목 선택에 대한 시각적 피드백과 함께 부드럽고 상호작용이 가능한 수평 스크롤 경험을 만듭니다.

## 기여하기

ItemScrollView를 개선하는데 도움을 주실 분들을 환영합니다! 이 코드는 많은 가능한 구현 방법 중 하나일 뿐이며, 여러분의 프로젝트를 위한 참고 자료나 시작점으로 사용하시기를 권장합니다.

기여하고 싶으시다면 풀 리퀘스트를 제출하거나 잠재적인 개선 사항 또는 버그 수정에 대해 논의하기 위해 이슈를 열어주세요. 이 컴포넌트를 더 좋게 만들기 위한 모든 피드백이나 제안을 감사히 받겠습니다.

---

ItemScrollView가 여러분의 프로젝트에 유용하게 쓰이기를 바랍니다! 질문이 있거나 추가 도움이 필요하시면 언제든지 이슈를 열거나 메인테이너에게 연락해 주세요.
