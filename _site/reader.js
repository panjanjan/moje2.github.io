document.addEventListener("DOMContentLoaded", function() {
    // Find the main content area and all images inside it
    const content = document.querySelector('.content');
    const images = content.querySelectorAll('img');

    // If there are no images (like on the homepage), do nothing
    if (images.length === 0) return;

    // 1. Create the UI elements
    const controlsDiv = document.createElement('div');
    controlsDiv.className = 'reader-controls';

    const toggleBtn = document.createElement('button');
    toggleBtn.textContent = 'Switch to Single Page Mode';


    const navDiv = document.createElement('div');
    navDiv.className = 'nav-buttons';
    navDiv.style.display = 'none'; // Hidden by default in scroll mode


    const prevBtn = document.createElement('button');
    prevBtn.textContent = 'Previous Page';

    const nextBtn = document.createElement('button');
    nextBtn.textContent = 'Next Page';


    // 2. Assemble and inject the controls before the first image
    navDiv.appendChild(prevBtn);
    navDiv.appendChild(nextBtn);
    controlsDiv.appendChild(toggleBtn);
    controlsDiv.appendChild(navDiv);
    content.insertBefore(controlsDiv, images[0]);

    // 3. State variables
    let isSinglePage = false;
    let currentIndex = 0;

    // 4. Function to update the display
    function updateView() {
        if (isSinglePage) {
            content.classList.add('single-page-mode');
            navDiv.style.display = 'flex';
            toggleBtn.textContent = 'Switch to Scroll Mode';

            // Loop through images: show the current one, hide the rest
            images.forEach((img, index) => {
                if (index === currentIndex) {
                    img.classList.add('active-page');
                } else {
                    img.classList.remove('active-page');
                }
            });
        } else {
            content.classList.remove('single-page-mode');
            navDiv.style.display = 'none';
            toggleBtn.textContent = 'Switch to Single Page Mode';

            // Remove the active class so standard CSS takes over

            images.forEach(img => img.classList.remove('active-page'));
        }
    }

    // 5. Event Listeners for the buttons
    toggleBtn.addEventListener('click', () => {
        isSinglePage = !isSinglePage;
        updateView();
    });

    nextBtn.addEventListener('click', () => {
        if (currentIndex < images.length - 1) {
            currentIndex++;
            updateView();
            window.scrollTo(0, 0); // Scroll to top when turning the page
        }
    });

    prevBtn.addEventListener('click', () => {
        if (currentIndex > 0) {
            currentIndex--;
            updateView();
            window.scrollTo(0, 0);
        }
    });
});
