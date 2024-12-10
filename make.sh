#!/bin/bash

# 기본 디렉토리 설정
DEFAULT_DIR="components"

# 컴포넌트 이름 받기
COMPONENT_NAME=$1

if [ -z "$COMPONENT_NAME" ]; then
  echo "❌ 컴포넌트 이름을 입력하세요!"
  echo "사용법: ./create-component.sh ComponentName"
  exit 1
fi

# 컴포넌트명을 하이픈 스타일로 변환
CLASS_NAME=$(echo "$COMPONENT_NAME" | sed -E 's/([a-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')

# 디렉토리 생성 (기본 디렉토리 사용)
COMPONENT_DIR="${DEFAULT_DIR}/${COMPONENT_NAME}"
mkdir -p "$COMPONENT_DIR"

# 컴포넌트 파일 경로
COMPONENT_FILE="${COMPONENT_DIR}/${COMPONENT_NAME}.tsx"

# 스타일 파일 경로
STYLE_FILE="${COMPONENT_DIR}/${COMPONENT_NAME}.module.scss"

# 클라이언트 컴포넌트 템플릿
COMPONENT_TEMPLATE=$(cat <<EOF
"use client";

import styles from "./${COMPONENT_NAME}.module.scss";
import classNames from "classnames/bind";

const cx = classNames.bind(styles);

export default function ${COMPONENT_NAME}() {
  return (
    <div className={cx("${CLASS_NAME}")}>
      <h1>${COMPONENT_NAME}</h1>
      <p>This is the ${COMPONENT_NAME} component.</p>
    </div>
  );
}
EOF
)

# SCSS 템플릿
STYLE_TEMPLATE=$(cat <<EOF
.${CLASS_NAME} {

}
EOF
)

# 파일 생성
echo "$COMPONENT_TEMPLATE" > "$COMPONENT_FILE"
echo "$STYLE_TEMPLATE" > "$STYLE_FILE"

# 결과 출력
echo "✅ 컴포넌트와 스타일 파일이 생성되었습니다!"
echo "📂 컴포넌트 디렉토리: $COMPONENT_DIR"
echo "📄 컴포넌트 파일: $COMPONENT_FILE"
echo "📄 스타일 파일: $STYLE_FILE"