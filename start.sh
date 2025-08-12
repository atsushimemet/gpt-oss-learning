#!/bin/bash

echo "GPT-OSS Learning 環境を起動中（モデル: Phi4-mini）..."

# コンテナをビルドして起動
docker compose up --build -d

echo "Ollamaサーバーの起動を待機中..."
sleep 10

# モデルが存在するかチェック
echo "Phi4-miniモデルの存在を確認中..."
if docker exec ollama ollama list | grep -q "phi4-mini"; then
    echo "Phi4-miniモデルは既にダウンロードされています"
else
    echo "Phi4-miniモデルをダウンロード中... (約2.7GB、時間がかかります)"
    docker exec ollama ollama pull phi4-mini
fi

echo "アプリケーションを起動中..."
docker compose restart app

echo "環境の準備が完了しました！"
echo "ログを確認するには: docker compose logs -f app"
