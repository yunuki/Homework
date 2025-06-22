//
//  ProductDetailWebViewConfiguration.swift
//  ProductDetail
//
//  Created by 윤재욱 on 6/21/25.
//

import WebKit

struct ProductDetailWebViewConfiguration {
    static func make(messageHandler: WKScriptMessageHandler) -> WKWebViewConfiguration {
        let contentController = WKUserContentController()
        contentController.add(messageHandler, name: "backAction")

        // Web <-> Native 간 인터페이스를 모르는 상황에서의 대응
        // 뒤로가기 버튼(.btn_go_back)이 동적으로 생성될 때까지 DOM 변화를 관찰하고,
        // 버튼이 발견되면 클릭 이벤트 리스너를 붙여 뒤로가기 버튼이 눌렸을 때 네이티브로 메시지를 전송하도록 한다.
        let script = """
        const observer = new MutationObserver(() => {
            const backButton = document.querySelector('.btn_go_back');
            if (backButton) {
                backButton.addEventListener('click', function () {
                    window.webkit.messageHandlers.backAction.postMessage(null);
                });
                observer.disconnect();
            }
        });

        observer.observe(document.body, { childList: true, subtree: true });
        """
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        contentController.addUserScript(userScript)

        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        return config
    }
}
