<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CDN TweenMax -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.0.5/gsap.min.js"></script>
    <script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;700&display=swap');

        .hidden {
        position: absolute;
        top: -1px;
        left: -1px;
        height: 1px;
        }

        :root {
        --background-white: #fffffd;
        --background-blue: #7dabdc;
        --pokeball-red: #fd5365;
        --pokeball-grey: #f0f0f0;
        --pokeball-black: #615e69;
        }

        body {
        color: #70757a;
        margin: 0;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: var(--background-blue);
        font-family: Roboto, Arial, Helvetica, sans-serif;
        }

        .pokeball {
        min-width: 300px;
        width: 300px;
        height: 500px;
        border: 1px solid black;
        position: relative;
        border-radius: 20px;
        overflow: hidden;
        display: flex;
        align-items: center;
        background-color: grey;
        background-repeat: no-repeat;
        background-size: 350px 350px;
        background-position: 50px 200px;
        transition: all 0.5s ease-in 0.3s;
        }

        .pokeball.open {
        background-color: var(--background-white);
        transition: all 0.5s ease-in;
        }

        .pokeball button {
        border: 1px solid var(--pokeball-black);
        background-color: var(--pokeball-grey);
        box-shadow: 
            inset 0px -3px 0px 0px #bdbdbd,
            inset 0px -4px 0px 0px var(--pokeball-black),
            0px 0px 0px 10px var(--pokeball-grey),
            0px 0px 0px 10px var(--pokeball-grey),
            0px 0px 0px 24px var(--pokeball-black);
        padding: 0;
        margin: 0;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 999;
        transition: top 1s;
        transition-delay: 0.3s;
        cursor: pointer;
        }

        .pokeball button:active {
        outline: 0;
        box-shadow: 
            inset 0px 3px 0px 0px #bdbdbd,
            inset 0px 4px 0px 0px var(--pokeball-black),
            0px 0px 0px 10px var(--pokeball-grey),
            0px 0px 0px 24px var(--pokeball-black);
        }

        .pokeball button:focus {
        outline: 0;
        }

        .pokeball.open button {
        top: 10%;
        box-shadow: 
            inset 0px -3px 0px 0px #bdbdbd,
            inset 0px -4px 0px 0px var(--pokeball-black),
            0px 0px 0px 10px var(--pokeball-grey),
            0px 0px 0px 10px var(--pokeball-grey),
            0px 0px 0px 24px var(--pokeball-black),
            0px 5px 0px 24px rgba(0,0,0,0.1);
        transition-delay: 0s;
        }

        .pokeball.open button:active {
        outline: 0;
        box-shadow: 
            inset 0px 3px 0px 0px #bdbdbd,
            inset 0px 4px 0px 0px var(--pokeball-black),
            0px 0px 0px 10px var(--pokeball-grey),
            0px 0px 0px 10px var(--pokeball-grey),
            0px 0px 0px 24px var(--pokeball-black),
            0px 5px 0px 24px rgba(0,0,0,0.1);
        }

        .pokeball::before {
        content: '';
        width: 100%;
        top: 0;
        background-color: var(--pokeball-red);
        position: absolute;
        height: calc(50% - 9px);
        border-bottom: 18px solid var(--pokeball-black);
        transition: all 1s;
        transition-delay: 0.3s;
        }

        .pokeball.open::before {
        top: -40%;
        box-shadow: 0px 5px 0px 0px rgba(0, 0, 0, 0.1);
        transition-delay: 0s;
        }

        .pokeball::after {
        content: '';
        width: 100%;
        background-color: white;
        position: absolute;
        top: calc(50% + 9px);
        height: calc(50% - 2px);
        border-top: 2px solid var(--pokeball-black);
        background-image: 
            radial-gradient(var(--pokeball-black) 35px, transparent 35px),
            radial-gradient(black 35px, transparent 36px),
            radial-gradient(var(--pokeball-black) 47px, transparent 47px);
        background-size: 96px 96px;
        background-position: 50% -57px;
        background-repeat: no-repeat;
        transition: all 1s;
        transition-delay: 0.3s;
        }

        .pokeball.open::after {
        top: 90%;
        box-shadow: 0px -5px 0px 0px rgba(0, 0, 0, 0.1);
        transition-delay: 0s;
        }

        .pokeball button svg {
        margin: 0 0 4px 4px;
        }

        .pokeball button:active svg {
        margin: 4px 0 0 4px;
        }

        .pokeball article {
        padding: 0 20px;
        font-size: 13px;
        line-height: 1.5;
        }

        .pokeball h1 {
        display: flex;
        justify-content: space-between;
        margin: 0;
        font-size: 21px;
        font-weight: normal;
        color: #111;
        }

        .pokeball h1 span:last-child {
        font-weight: lighter;
        }

        .pokeball p {
        margin: 20px 0;
        }

        .pokeball ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-row: 1fr 1fr 1fr;
        column-gap: 22px;
        }

        .pokeball li {
        margin: 0 0 4px 0;
        }

        .pokeball label {
        display: flex;
        justify-content: space-between;
        padding: 0 5px;
        }

        .pokeball label span:last-child {
        color: black;
        }

        .pokeball meter {
        width: 100%;
        height: 6px;
        display: block;
        border: 1px solid black;
        border-radius: 10px;
        position: relative;
        color: transparent;
        font-size: 0;
        }

        .pokeball meter::-webkit-meter-bar {
        background: none;
        background-color: #d8d8d8;
        border: none;
        box-shadow: inset 0px 0px 0px 1px rgba(0,0,0,0.2);
        border-radius: 10px;
        }
        .pokeball meter::-webkit-meter-optimum-value {
        background: none;
        background-color: #60ca60;
        box-shadow: inset 0px 0px 0px 1px rgba(0,0,0,0.2);
        border-radius: 10px;
        }
        .pokeball meter::-webkit-meter-suboptimum-value {
        background: none;
        background-color: #f0c85c;
        box-shadow: inset 0px 0px 0px 1px rgba(0,0,0,0.2);
        border-radius: 10px;
        }
        .pokeball meter::-webkit-meter-even-less-good-value {
        background: none;
        background-color: #ee7863;
        box-shadow: inset 0px 0px 0px 1px rgba(0,0,0,0.2);
        border-radius: 10px;
        }

        .tags span {
        background-color: #f1f1f1;
        border-radius: 20px;
        padding: 6px 16px;
        font-weight: normal;
        letter-spacing: 2px;
        margin-right: 4px;
        }

        span.fire {
        color: white;
        text-shadow: 1px 1px 0px rgba(0,0,0,0.2);
        background-color: #fb613e;
        }

        span.flying {
        color: white;
        text-shadow: 1px 1px 0px rgba(0,0,0,0.2);
        background-color: #5684b5;
        }

        .pokemon {
        position: relative;
        text-align: center;
        margin-left: 60px;
        }

        .pokemon img {
        width: 300px;
        background-image: radial-gradient(#5684b5 60%, transparent 60%);
        background-size: 300px 300px;
        background-repeat: no-repeat;
        background-position: 50% 90%;
        filter: url(#test);
        }

        .summon {
        position: absolute;
        }

        p.so{
        	font-size: 20px;
        }
        @media only screen and (min-width: 765px) {
        body {
            transform: scale(0.8)
        }
        }
    </style>
</head>
<body>
    <div id="pokeball-1" class="pokeball">
        <button id="toggle-button"></button>
        <article>
          <h1><span>배현석</span><span>#777</span></h1>
          <div class="species">Love Pokemon</div>
          <p class="so">SSAFY 3기 최고 꽃미남 배현석 </p>
          <ul>
            <li>
              <label><span>HP</span><span>330</span></label>
              <meter min="266" low="293" high="333" optimum="360" max="360" value="330">330/360</meter>
            </li>
            <li>
              <label><span>Speed</span><span>280</span></label>
              <meter min="184" low="236" high="276" optimum="328" max="328" value="280">280/328</meter>
            </li>
            <li>
              <label><span>Attack</span><span>280</span></label>
              <meter min="155" low="204" high="244" optimum="293" max="293" value="270">280/293</meter>
            </li>
            <li>
              <label><span>Defense</span><span>190</span></label>
              <meter min="144" low="192" high="232" optimum="280" max="280" value="190">190/280</meter>
            </li>
            <li>
              <label><span>Sp. Atk</span><span>340</span></label>
              <meter min="200" low="254" high="294" optimum="348" max="348" value="340">340/348</meter>
            </li>
            <li>
              <label><span>Sp. Def:</span><span>230</span></label>
              <meter min="157" low="206" high="246" optimum="295" max="295" value="230">230/295</meter>
            </li>
          </ul>
        </article>
      </div>
      <div class="pokemon">
        <a href="${root }/boot"><img src="img/hyunsuck.jpg" alt="charizard" />
        <div class="tags">
          <span class="fire">Fire</span>
          <span class="flying">Flying</span>
          <span class="height">1.7 m</span>
          <span class="weight">70.5 kg</span>
        </div>
      </div>
      <svg id="summon-1" width="600px" height="500px" class="summon hidden">
        <path 
           class="path"
           d="M100 250 L280 150 L460 215"
           fill="none"
           stroke="black"
           stroke-width="15px"
           stroke-dasharray="100%"
           stroke-dashoffset="100%" />
      </svg>
      <svg width="500px" height="500px" class="hidden">
        <defs>
          <filter id="spawn-line">
            <feTurbulence 
               id="line-turbulence"
               in="SourceGraphic"
               type="fractalNoise"
               baseFrequency="0.013"
               numOctaves="1"
               result="TURBULENCE_1" />
            <feDisplacementMap
               id="line-displacement"
               in="SourceGraphic"
               in2="TURBULENCE_1"
               scale="200"
               xChannelSelector="R"
               yChannelSelector="G"
               result="DISPLACEMENT_1" />
            <feFlood
               in="DISPLACEMENT_1"
               flood-color="#fffdc4"
               flood-opacity="1"
               result="FLOOD_1" />
            <feComposite
               in="FLOOD_1"
               in2="DISPLACEMENT_1"
               operator="in"
               result="COMPOSITE_1" />
          </filter>
          <filter id="spawn-pokemon">
            <feTurbulence 
               id="pokemon-turbulence"
               in="SourceGraphic"
               type="fractalNoise"
               baseFrequency="0.015"
               numOctaves="1"
               result="TURBULENCE_1" />
            <feDisplacementMap
               id="pokemon-displacement"
               in="SourceGraphic"
               in2="TURBULENCE_1"
               scale="100"
               xChannelSelector="R"
               yChannelSelector="G"
               result="DISPLACEMENT_1" />
            <feFlood
               in="DISPLACEMENT_1"
               flood-color="#fffdc4"
               flood-opacity="1"
               result="FLOOD_1" />
            <feComposite
               in="FLOOD_1"
               in2="DISPLACEMENT_1"
               operator="in"
               result="COMPOSITE_1" />
          </filter>
          <filter id="retrieve-line">
            <feTurbulence 
               in="SourceGraphic"
               type="fractalNoise"
               baseFrequency="0.015"
               numOctaves="1"
               result="TURBULENCE_1" />
            <feDisplacementMap
               in="SourceGraphic"
               in2="TURBULENCE_1"
               scale="200"
               xChannelSelector="R"
               yChannelSelector="G"
               result="DISPLACEMENT_1" />
            <feFlood
               in="DISPLACEMENT_1"
               flood-color="#fec9c9"
               flood-opacity="1"
               result="FLOOD_1" />
            <feComposite
               in="FLOOD_1"
               in2="DISPLACEMENT_1"
               operator="in"
               result="COMPOSITE_1" />
          </filter>
          <filter id="retrieve-pokemon">
            <feTurbulence 
               id="retrieve-turbulence"
               in="SourceGraphic"
               type="fractalNoise"
               baseFrequency="0.015"
               numOctaves="1"
               result="TURBULENCE_1" />
            <feDisplacementMap
               id="retrieve-displacement"
               in="SourceGraphic"
               in2="TURBULENCE_1"
               scale="100"
               xChannelSelector="R"
               yChannelSelector="G"
               result="DISPLACEMENT_1" />
            <feFlood
               in="DISPLACEMENT_1"
               flood-color="#fec9c9"
               flood-opacity="1"
               result="FLOOD_1" />
            <feComposite
               in="FLOOD_1"
               in2="DISPLACEMENT_1"
               operator="in"
               result="COMPOSITE_1" />
          </filter>
        </defs>
      </svg>
      <script>
        (function() {
  function togglePokeball(event) {
    event.preventDefault();

    const pokeball = document.getElementById('pokeball-1');
    if (pokeball.classList.contains('open')) {
      pokeball.classList.remove('open');
      retrieve.restart();
    } else {
      pokeball.classList.add('open');
      spawn.restart();
    }
  }

  const spawn = gsap
  .timeline(
    {
      onStart: function() {
        document.querySelector('.summon').classList.remove('hidden');
        document.querySelector('.summon').style.filter = 'url(#spawn-line)';
        document.querySelector('.pokemon img').style.filter = 'url(#spawn-pokemon)';
      },
      onComplete: function() {
        document.querySelector('.summon').classList.add('hidden');
        document.querySelector('.summon').style.filter = 'none';
        document.querySelector('.pokemon img').style.filter = 'none';
      },
      paused: true,
    },
  ) 
  .set('.path', {
    attr: {
      'stroke-dashoffset': '100%',
    },
  })
  .to('.path', 
      {
    delay: 0.2,
    duration: 0.2,
    attr: {
      'stroke-dashoffset': '0%',
    },
  },
  )
  .to('.path',
      {
    duration: 0.2,
    attr: {
      'stroke-dashoffset': '-100%',
    },
  },
  )
  .from('.pokemon img', 
        {
    duration: 0.2,
    scale: 0,
  },
  0.4,
  )
  .to('#pokemon-displacement',
      {
    duration: 0.8,
    attr: {
      scale: 0
    },
    ease: 'none'
  },
  0.2
  )
  .to('#pokemon-turbulence',
      {
    duration: 0.8,
    attr: {
      baseFrequency: 0.03
    },
    ease: 'none'
  },
  0.2
  )
  .from('.tags',
        {
    opacity: 0,
  },
  0.4
  );

  const retrieve = gsap
  .timeline(
    {
      onStart: function() {
        document.querySelector('.summon').classList.remove('hidden');
        document.querySelector('.summon').style.filter = 'url(#retrieve-line)';
        document.querySelector('.pokemon img').style.filter = 'url(#retrieve-pokemon)';
      },
      onComplete: function() {
        document.querySelector('.summon').classList.add('hidden');
        document.querySelector('.summon').style.filter = 'none';
        document.querySelector('.pokemon img').style.filter = 'none';
      },
      paused: true,
    },
  )
  .set('.path', {
    attr: {
      'stroke-dashoffset': '-100%',
    },
  })
  .to('.tags',
      {
    opacity: 0,
  }
  )
  .from('#retrieve-displacement',
        {
    duration: 0.3,
    attr: {
      scale: 0
    }
  },
  0,
  )
  .from('#retrieve-turbulence',
        {
    duration: 0.3,
    attr: {
      baseFrequency: 0
    }
  },
  0
  )
  .to('.pokemon img', 
      {
    scale: 0,
    duration: 0.2
  },
  0.3,
  )
  .to('.path', 
      {
    duration: 0.2,
    attr: {
      'stroke-dashoffset': '0%',
    },
  },
  0.35
  )
  .to('.path',
      {
    duration: 0.2,
    attr: {
      'stroke-dashoffset': '100%',
    },
  },
  0.45
  );
  const button = document.getElementById('toggle-button');
  button.addEventListener('click', togglePokeball)
})();
    </script>
</body>
</html>