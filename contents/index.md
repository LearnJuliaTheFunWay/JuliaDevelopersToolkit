[//]: # (This file is only included on the website.)

<script>
  window.dataLayer = window.dataLayer || [];
  function gtag() { dataLayer.push(arguments); }
  gtag('js', new Date());

  gtag('config', 'G-H1EF16DE4J');
</script>

This is the homepage.

<div class="container">
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="navbar-brand navbar-toggler" id="translation">
                    <img src="images/translation.svg" width="50" height="50" alt="">
                </a>
            </li>
        </ul>
        <div class="row">
            <div class="col-sm">
                <div class="text-center">
                    <svg id="logo-svg"></svg>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm">
                <div class="text-center">

                    <h1 class="book-title" contentLang="en" hidden>Julia
                    Developer's Toolkit</h1>
                    <p class="book-subtitle" contentLang="en" hidden>Your ultimate guide for exploring and building Julia packages</p>
                    <p class="book-subtitle" contentLang="en" hidden>By <a href="https://github.com/findmyway"
                            target="_blank">Jun Tian</a></p>

                    <h1 class="book-title" contentLang="zh">Julia 开发者的工具箱</h1>
                    <p class="book-subtitle" contentLang="zh">探索和构建 Julia 包的终极指南</p>
                    <p class="book-subtitle" contentLang="zh"><a href="https://github.com/findmyway"
                            target="_blank">田俊</a> 著</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm">
                <div class="text-center">
                    <wired-button elevation="2" contentLang="en" hidden onclick="location.href='/JuliaDevelopersToolkit/en/';">📙Read Online</wired-button>
                    <wired-button elevation="2" contentLang="en" hidden>🧡Support Me</wired-button>
                    <wired-button elevation="2" contentLang="zh" onclick="location.href='/JuliaDevelopersToolkit/zh/';">📙在线阅读</wired-button>
                    <wired-button elevation="2" contentLang="zh">🧡支持作者</wired-button>
                </div>
            </div>
        </div>
    </div>

    <!-- draw logo -->
    <script src="https://unpkg.com/roughjs@latest/bundled/rough.js"></script>
    <script>
        const svg = document.getElementById('logo-svg');
        const rc = rough.svg(svg);

        svg.appendChild(rc.polygon([[0, 100], [100, 100], [50, 150]], {
            stroke: 'black',
            hachureAngle: 65,
            fill: '#CB3C33',
            fillWeight: 2,
            roughness: 2
        }));

        svg.appendChild(rc.polygon([[50, 150], [100, 100], [150, 150]], {
            stroke: 'black',
            hachureAngle: 65,
            fill: '#389826',
            fillWeight: 2,
            roughness: 2
        }));

        svg.appendChild(rc.polygon([[150, 150], [100, 100], [200, 100]], {
            stroke: 'black',
            hachureAngle: 65,
            fill: '#9558B2',
            fillWeight: 2,
            roughness: 2
        }));

        svg.appendChild(rc.polygon([[50, 100], [100, 100], [100, 0], [50, 50]], {
            stroke: 'black',
            hachureAngle: 65,
            fill: '#4063D8',
            fillWeight: 2,
            roughness: 2
        }));
    </script>

    <script>
        document.getElementById("translation").onclick = function () { toggleLang() };

        function toggleLang() {
            contents = document.querySelectorAll("[contentLang]");
            contents.forEach(x => {
                if (x.hasAttribute("hidden")) {
                    x.removeAttribute("hidden");
                }
                else {
                    x.setAttribute("hidden", true);
                }
            });
        }
    </script>

    <!-- add buttons -->
    <script async src="https://unpkg.com/wired-elements/lib/wired-elements-iife.js"></script>
