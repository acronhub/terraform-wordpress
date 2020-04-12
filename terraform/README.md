# インフラ構成 Terraform

AWS の構築は Terraform を使用します

## 必要環境

- [Docker](https://www.docker.com/docker-mac) をインストール済み

## 事前準備

### AWS コンソール
```
# EC2 AMIの準備
1. EC2でAMI MarketPlaceから以下のAMIを利用できるようにしてください
  WordPress Certified by Bitnami and Automattic

# S3バケットの準備
1. S3でterraform用のバケットを作成してください
　バージョン管理は有効にしておくといいです
2. main.tf内の「bucket = "terraform-xxx"」を作成したバケット名に変更してください
```

### AWS クレデンシャルを設定
```
$ cd terrafrom
$ cp -a .env.example .env
$ vi .env
```

### SSH鍵の作成
```
$ cd terrafrom/.ssh
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

## 初期化
```
$ cd terrafrom
$ sh bin/init.sh
```

## 実行方法
```
$ cd terrafrom

# プラン作成
$ sh bin/plan.sh

# 実行
$ sh bin/apply.sh
```

- terraform.tfstate は S3 で管理しています