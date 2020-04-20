# iOS-FirebaseSample
  Firebaseの機能であるAuthentication, Firestore, Storageのサンプルを作成しました。
# setup

## 1. CocoaPods
- gemのrubyコマンドでcocoapodsをインストール
```
sudo gem install cocoapods
```

- Podfileに書いたライブラリをインストール
```
pod install
```

## 2. GoogleService-Info.plistを追加
Firebaseのプロジェクト作成時に設定ファイルのダウンロードを行い、
Xcodeのプロジェクトに追加

参考: https://support.google.com/firebase/answer/7015592?hl=ja

# 実装内容

## 1. Authentication
  メールアドレス、パスワードで認証するログイン機能を実装しました。
  
<img src="https://user-images.githubusercontent.com/48383852/79778126-3a406d80-8373-11ea-9643-31bc3fea7d5a.png" width="100px">

## 2. Firestore
  名前、メールアドレス、年齢のデータを登録、閲覧できる機能を実装しました。
  
<img src="https://user-images.githubusercontent.com/48383852/79778197-55ab7880-8373-11ea-9d4b-126ea109d67a.png" width="100px">

## 3. Storage
  Web上のStorageに保存されているテキストファイルをロードして中身を表示します。
  
<img src="https://user-images.githubusercontent.com/48383852/79778253-6a880c00-8373-11ea-8249-1058ede41474.png" width="100px">

# 参考文献
[サーバーレス開発プラットフォーム Firebase入門](https://www.shuwasystem.co.jp/book/9784798057750.html)
