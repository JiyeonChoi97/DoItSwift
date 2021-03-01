//
//  ViewController.swift
//  Web
//
//  Created by 최지연 on 2021/02/28.
//
// 웹 뷰로 간단한 웹 브라우저 만들기
// - 앱 시작할 때 지정된 페이지 보여주기 : loadWebPage
// - 앱 로딩 시 액티비티 인디케이터 구현
// - [Site1] [Site2] 버튼 클릭 : 웹 사이트 이동
// - [정지] [재로딩] [이전페이지] [다음페이지] 버튼 구현
// - [Html] 버튼 클릭 : 변수 내용이 Html 형식에 맞추어 웹 뷰에 나타남
// - "http://" 체크 후 [Go] 버튼 클릭 시 링크 이동

import UIKit
import WebKit // WEbView 이용시 import 해주어야 함

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url) // url 값을 받아 URL형은로 선언
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myWebView.navigationDelegate = self
        // ifo.plist 설정 필요 ! 
        loadWebPage("http://naver.com")
    }
    
    // 로딩 중인지 확인하기 위한 함수
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    // 로딩 완료 : 인디케이터 중지하고 숨기기
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // 로딩 실패 : 인디케이터 중지하고 숨기기
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // "http://" 체크
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://github.com/JiyeonChoi97")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://www.google.com/")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> JIYEON HTML TEST </h1> <p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"http:naver.com\">naver</a>로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

