//
//  ProductDetailViewController.swift
//  ProductDetail
//
//  Created by 윤재욱 on 6/21/25.
//

import UIKit
import WebKit

import DI

final class ProductDetailViewController: UIViewController, ViewControllerType {
    
    private lazy var configuration = ProductDetailWebViewConfiguration.make(messageHandler: self)
    private lazy var webView = WKWebView(frame: .zero, configuration: configuration)
    
    let viewModel: ProductDetailViewModel
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        loadURL(viewModel.linkURL)
    }
    
    private func setConstraints() {
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func loadURL(_ url: URL) {
        let request = URLRequest(url: viewModel.linkURL)
        webView.load(request)
    }
}

extension ProductDetailViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let webViewMessage = ProductDetailWebViewMessage(rawValue: message.name) else { return }
        switch webViewMessage {
        case .backAction:
            if webView.canGoBack {
                webView.goBack()
            } else {
                viewModel.sendAction(.onTapBackButton)
            }
        }
    }
}
