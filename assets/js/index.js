document.addEventListener('DOMContentLoaded', () => {
    const fetchButton = document.getElementById('fetch-stars');

    fetchButton.addEventListener('click', async () => {
        const owner = document.getElementById('owner').value;
        const repo = document.getElementById('repo').value;

        async function getStarCount() {
            try {
                const response = await fetch(`https://api.github.com/repos/${owner}/${repo}`);

                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }

                const data = await response.json();
                return data.stargazers_count;
            } catch (error) {
                console.error('Error fetching star count:', error);
                return null;
            }
        }

        getStarCount().then(stars => {
            if (stars !== null) {
                document.getElementById('star-count').innerText = stars;
            } else {
                document.getElementById('star-count').innerText = 'N/A';
            }
        });
    });
});
