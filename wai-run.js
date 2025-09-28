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
