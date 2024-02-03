import requests
import json

def start_github_action(username, repository, token, workflow_name):
    url = f'https://api.github.com/repos/{username}/{repository}/actions/workflows/{workflow_name}/dispatches'
    payload = {
        "ref": "main"
    }
    headers = {
        'Authorization': f'token {token}',
        'Accept': 'application/vnd.github.v3+json'
    }
    response = requests.post(url, headers=headers, data=json.dumps(payload))
    if response.status_code == 204:
        print("GitHub Action 已成功启动！")
    else:
        print(f"启动 GitHub Action 失败，状态码：{response.status_code}")