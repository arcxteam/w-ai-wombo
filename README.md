# Guides Running W.ai (Wombo AI) for Training and Inference Using the CLI

![6255724677167171025](https://github.com/user-attachments/assets/a3abc643-106d-4557-8131-053c367ed88f)

**W.ai as Wombo Studios is building the Global AI Supercomputer – a worldwide network that uses the spare power from everyday devices to create a massive, shared resource for Artificial Intelligence backed by NVIDIA**

## What You Can Gain

- **Earn W Points** for every task completed by your run.
- Points may potentially be converted into tokens in the future.
- The more miner-node you run, the greater your earnings.
- Read there [FAQs](https://docs.w.ai/faq) and join W.ai [Discord](https://discord.com/invite/w-ai)

## Initial Requirements

| Requirement     | Minimum                |
| :----------     | :--------------------  |
| **Linux**       | Ubuntu 20 - 22 - 24 LTS          |
| **Mac**         | Chip M1, M2, M3, M4              |
| **CPU**         | vCores 8 with 8GB RAM - more     |
| **VRAM GPU**    | Min 6GB - more VRAM              |
| **GPU-Series**  | GTX 1080 - RTX w/ A4xx,A6xx,20xx,30xx,40xx,50xx |       
| **STORAGE**     | Up 50GB - 99GB - more spaces             |

## Quick Registration

### Register and Obtain an API Key
- Visit the dashboard and sign up using an email: [https://app.w.ai/auth/signup](https://w.ai/r/1WLMEQDB).
- Navigate to the `API-KEYS` section.
- Create a new key `wsk-xxx` **SAVE AS**
- Copy the key; you can create multiple keys, but ensure you save them securely.

<img width="1624" height="486" alt="image" src="https://github.com/user-attachments/assets/bfab7771-4ff5-4540-96c9-c015e04d5c9e" />

## GPU Rental or Local Setup
- In my opinion, Octaspace offers cheaper rental real costs compared to other providers.
- Top-up balance in USDC/USDT on the BSC network. Register at: [https://cube.octa.computer/users/sign_up](https://octa.space/?ref=rTXHXwn7D96).
- After register and successfully top up, visit [https://marketplace.octa.space/](https://marketplace.octa.space/)
- Select menu **compute rental** in the choose **Ubuntu 22.04 LTS** template. e.g., rental machine RTX 20xx - 30xx - 40xx - 50xx or other options.
- Beside running W.AI, you can also run other nodes, such as **nexus.xyz, Gensyn and more**, to maximize GPU resource utilization.

## Optimal your resources - <mark>if you running by rent</mark>
- Guides run [Gensyn AI](https://github.com/arcxteam/rl-swarm) **this my modify config, support all model GPU with low RAM and boost huge rewards Gensyn**
- Guides run [Nexus.xyz](https://github.com/arcxteam/nexus-node) with CLI mode
- Setup more if have spaces memory VRAM

## Installation Setup

### Update System and Install Dependencies

```bash
apt update && apt upgrade -y && \
apt install screen curl nload tree iptables git wget lz4 jq make gcc nano automake autoconf htop tmux libgbm1 protobuf-compiler python3 python3-pip python3-venv python3-dev python3-setuptools \
tar clang ncdu unzip build-essential pkg-config libssl-dev libleveldb-dev \
speedtest-cli ca-certificates libffi-dev libsqlite3-dev -y
```

### Install Node.js, NPM, Yarn and PM2

```bash
source <(curl -s https://raw.githubusercontent.com/arcxteam/w.ai-wombo/refs/heads/main/node-setup.sh)
```

### Install W.AI CLI

```bash
# Install CLI
curl -fsSL https://app.w.ai/install.sh | bash

# Check version
wai --version
```

- <mark>If the version is displayed, proceed to the steps below.</mark>

### Start Running

```bash
# Replace api-key
export W_AI_API_KEY=your_api_key

# Run
wai run
```

> Done! Check the dashboard periodically... your **W-Points** should now start accumulating!

## Advanced Config (Multiple Nodes)

### Copy and paste directly into the terminal (replace `wai-api-key`)

```bash
# Create configuration file
cat > wai.run.js << 'CONFIG'
module.exports = {
  apps: [{
    name: 'wai-miner',
    script: 'wai',
    args: 'run',
    instances: 1, // default 1, add more up to u
    autorestart: true,
    watch: false,
    max_memory_restart: '1G', // default 1GB RAM
    env: {
      NODE_ENV: 'production',
      W_AI_API_KEY: 'wai-api-key'
    }
  }]
};
CONFIG

# Run multiple nodes
pm2 start wai.run.js

# Save PM2 configuration
pm2 startup
pm2 save
```

### Useful Commands

```bash
# Check running status
pm2 list
```

```bash
# View logs
pm2 logs wai-miner
```

```bash
# Monitor GPU
nvidia-smi
```

```bash
# Monitor GPU in real-time
watch -n 1 nvidia-smi
```

### Internet Optimization Tips

```bash
# Test connection (ping, etc.)
speedtest-cli
```

```bash
# Monitor bandwidth
nload
```

### Automatic Restart on Failure

```bash
# PM2 ensures your nodes keep running
pm2 startup
pm2 save
```

## Tips

### What Worked:
- **Start with 1 node**: Test it for 24 hours.
- **Scale to 4 nodes**: Maybe internet could handle it.
- **Use PM2**: Keeps everything running smoothly.
- **Monitor closely**: Track earnings daily.

### Common Issues & Solutions:
1. **"Connection timeout"**: Check your internet stability.
2. **"GPU memory full"**: Reduce the number of nodes.
3. **"Invalid API key"**: Double-check your key.
4. **"No tasks available"**: Wait, tasks come in waves.

### Pro Tips:
- **Run 24/7**: Maximum uptime = maximum earnings.
- **Join the DISCORD community**.
- **Prepare a backup data**.
