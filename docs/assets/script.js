const healthButton = document.getElementById('healthButton');
const healthResult = document.getElementById('healthResult');

healthButton.addEventListener('click', () => {
  const now = new Date().toLocaleString();
  healthResult.textContent = `Demo health check passed at ${now}. Website assets loaded successfully.`;
});
