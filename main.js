document.addEventListener('DOMContentLoaded', function () {
    var sidebarToggler = document.querySelector('.sidebar-toggler');
    var dropdownToggle = document.querySelectorAll('.dropdown-toggle');
    
    if (sidebarToggler) {
        sidebarToggler.addEventListener('click', function (event) {
            event.preventDefault(); // Prevents the default behavior (e.g., navigating to a new page)
            var sidebar = document.querySelector('.sidebar');
            var content = document.querySelector('.content');
            sidebar.classList.toggle('open');
            content.classList.toggle('open');
        });
    }

    if (dropdownToggle) {
        dropdownToggle.forEach(function (element) {
            element.addEventListener('click', function (event) {
                event.preventDefault(); // Prevents the default behavior (e.g., navigating to a new page)
                console.log("Drop down1");
                var dropdownMenuEnd = document.querySelector('.dropdown-menu-end');
                dropdownToggle.forEach(function (toggleElement) {
                    toggleElement.classList.toggle('show');
                });
                dropdownMenuEnd.classList.toggle('show');
                console.log("Drop down2");
            });
        });
    }
});
