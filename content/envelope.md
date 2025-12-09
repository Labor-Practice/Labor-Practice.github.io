---
title: 来自用户的感谢信
toc: false
comments: false
---

<style>
  :root{
    --env-width: 520px;
    --env-height: 280px;
    --env-open-height: 480px;
    --paper-color: #fffdf7;
    --env-color: #e6a07a;
    --shadow: 0 8px 20px rgba(0,0,0,0.18);
    --radius: 12px;
    --bg-gradient-start: #f6f7fb;
    --bg-gradient-end: #eef3f8;
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", "PingFang SC", "Hiragino Sans GB", "Microsoft Yahei", sans-serif;

    /* ===== 浅色模式颜色 ===== */
    --paper-color-light: #fffdf7;
    --env-color-light: #e6a07a;
    --env-shade-light: #d98357;
    --flap-top-light: #f5d3bf;
    --flap-bottom-light: #eaa77f;
    --text-light: #2f2a27;
    --text-sub-light: #5b5047;
    --shadow-light: 0 8px 20px rgba(0,0,0,0.18);

    /* ===== 深色模式颜色 ===== */
    --paper-color-dark: #2a2a2a;
    --env-color-dark: #b87555;
    --env-shade-dark: #8d5a3f;
    --flap-top-dark: #d4a68a;
    --flap-bottom-dark: #c0906f;
    --text-dark: #e6e6e6;
    --text-sub-dark: #b5a597;
    --shadow-dark: 0 8px 20px rgba(0,0,0,0.5);

    /* ===== 浅色默认：变量指向浅色 ===== */
    --paper-color: var(--paper-color-light);
    --env-color: var(--env-color-light);
    --env-shade: var(--env-shade-light);
    --flap-top: var(--flap-top-light);
    --flap-bottom: var(--flap-bottom-light);
    --text-main: var(--text-light);
    --text-sub: var(--text-sub-light);
    --shadow: var(--shadow-light);

    /* 背景：想要透明可以改成 transparent */
    --bg-start: #f6f7fb;
    --bg-end: #eef3f8;

    font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue",
                 "PingFang SC", "Hiragino Sans GB", "Microsoft Yahei", sans-serif;
  }

  

  /* ===== 自动深色模式切换 ===== */
  @media (prefers-color-scheme: dark) {
    :root {
      /* --paper-color: var(--paper-color-dark); */
      /* --env-color: var(--env-color-dark); */
      --env-shade: var(--env-shade-dark);
      --flap-top: var(--flap-top-dark);
      --flap-bottom: var(--flap-bottom-dark);
      --text-main: var(--text-dark);
      --text-sub: var(--text-sub-dark);
      --shadow: var(--shadow-dark);

      --bg-start: #1a1a1a;
      --bg-end: #2d2d2d;

      /* ===== 背景透明模式（可选）=====
         想让背景透明，只取消下面两行注释
      */
      --bg-start: transparent;
      --bg-end: transparent;
    }
  }

  .envelope-container {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    margin: 0;
    /* background: linear-gradient(180deg, var(--bg-gradient-start) 0%, var(--bg-gradient-end) 100%); */
    background: transparent;
    padding: 140px 24px 80px;
  }

  .envelope-list {
    display: flex;
    flex-direction: column;
    gap: 120px;
    width: 100%;
    max-width: 800px;
    align-items: center;
  }

  .envelope{
    width: 100%;
    max-width: var(--env-width);
    min-height: var(--env-height);
    position: relative;
    perspective: 900px;
    cursor: pointer;
    display: block;
    text-decoration: none;
    transition: transform 0.3s ease, min-height 0.3s ease;
    margin: 0 auto;
  }

  .envelope:hover {
    transform: translateY(-8px) scale(1.02);
  }

  .env-body{
    width: 100%;
    min-height: var(--env-height);
    background: linear-gradient(180deg, var(--env-color), #d98357 80%);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    position: relative;
    overflow: visible;
    padding-bottom: 18%;
    transition: min-height 0.3s ease;
  }

  @media (prefers-color-scheme: dark) {
    .env-body {
      background: linear-gradient(180deg, var(--env-color), #8d5a3f 80%);
    }
  }

  .env-flap{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 50%;
    transform-origin: top center;
    transform: rotateX(0deg);
    transition: transform 450ms cubic-bezier(.2,.9,.2,1);
    z-index: 3;
    overflow: hidden;
    border-radius: var(--radius) var(--radius) 0 0;
  }

  .env-flap::before{
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 200%;
    background: linear-gradient(180deg,#f5d3bf,#eaa77f);
    clip-path: polygon(
      3% 0%, 
      50% 95%, 
      97% 0%
    );
    box-shadow: inset 0 -6px 14px rgba(0,0,0,0.08);
  }

  @media (prefers-color-scheme: dark) {
    .env-flap::before {
      background: linear-gradient(180deg,#d4a68a,#c0906f);
      box-shadow: inset 0 -6px 14px rgba(0,0,0,0.3);
    }
  }

  .letter{
    position: absolute;
    inset: 32px 28px 26px 28px;
    background: var(--paper-color);
    border-radius: 10px;
    box-shadow: 0 6px 16px rgba(0,0,0,0.12);
    padding: 22px 22px 20px;
    z-index: 2;
    transform: translateY(8%);
    opacity: 0;
    max-height: 0;
    overflow: hidden;
    transition: opacity 320ms ease, max-height 480ms ease, transform 420ms cubic-bezier(.2,.9,.2,1);
  }

  @media (prefers-color-scheme: dark) {
    .letter {
      box-shadow: 0 6px 16px rgba(0,0,0,0.6);
    }
  }

  .envelope.open{
    min-height: var(--env-open-height);
  }

  .envelope.open .env-body{
    min-height: var(--env-open-height);
  }

  .envelope.open .env-flap,
  .envelope.open:focus-within .env-flap{
    transform: rotateX(-180deg);
    box-shadow: 0 -20px 40px rgba(0,0,0,0.12);
  }

  @media (prefers-color-scheme: dark) {
    .envelope.open .env-flap,
    .envelope.open:focus-within .env-flap{
      box-shadow: 0 -20px 40px rgba(0,0,0,0.5);
    }
  }

  .envelope.open .letter,
  .envelope.open:focus-within .letter{
    opacity: 1;
    max-height: var(--letter-open-height, 1000px);
    transform: translateY(0%);
  }

  .meta{
    display: flex;
    gap: 10px;
    align-items: center;
    margin-bottom: 10px;
  }

  .avatar{
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: linear-gradient(135deg,#ffd9c7,#ffd2a8);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    color: #7a3b1f;
    flex-shrink: 0;
    font-size: 18px;
  }

  @media (prefers-color-scheme: dark) {
    .avatar {
      background: linear-gradient(135deg,#d4a68a,#c0906f);
      color: #1a1a1a;
    }
  }

  .meta .info{
    flex: 1;
  }

  .meta .by{
    font-size: 13px;
    color: #6b5a4a;
    line-height: 1.4;
    font-weight: 500;
  }

  @media (prefers-color-scheme: dark) {
    .meta .by {
      color: #c4b5a5;
    }
  }

  .meta .date{
    font-size: 12px;
    color: #9b8b7a;
  }

  @media (prefers-color-scheme: dark) {
    .meta .date {
      color: #8a7a6a;
    }
  }

  .title{
    font-size: 18px;
    font-weight: 700;
    color: #2f2a27;
    margin: 4px 0 10px;
    letter-spacing: 0.2px;
    line-height: 1.3;
  }

  @media (prefers-color-scheme: dark) {
    .title {
      color: #e5e5e5;
    }
  }

  .excerpt{
    font-size: 13px;
    color: #5b5047;
    line-height: 1.5;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }

  @media (prefers-color-scheme: dark) {
    .excerpt {
      color: #b5a597;
    }
  }

  .tags{
    margin-top: 12px;
    display: flex;
    gap: 6px;
    flex-wrap: wrap;
  }

  .tag{
    font-size: 11px;
    padding: 4px 10px;
    background: rgba(0,0,0,0.04);
    border-radius: 999px;
    color: #5a4b3f;
  }

  @media (prefers-color-scheme: dark) {
    .tag {
      background: rgba(255,255,255,0.1);
      color: #c4b5a5;
    }
  }

  .envelope:focus-within{
    outline: 3px solid rgba(255,180,120,0.3);
    outline-offset: 4px;
    border-radius: var(--radius);
  }

  @media (prefers-color-scheme: dark) {
    .envelope:focus-within{
      outline: 3px solid rgba(255,180,120,0.5);
    }
  }
</style>

<div class="envelope-container">
  <div class="envelope-list">
    <a href="https://example.com/article1" class="envelope" tabindex="0">
      <div class="env-body"></div>
      <div class="env-flap"></div>
      <article class="letter">
        <div class="meta">
          <div class="avatar">A</div>
          <div class="info">
            <div class="by">作者：爆米花</div>
            <div class="date">2025-12-09</div>
          </div>
        </div>
        <h1 class="title">“旧物新生”让衣柜轻松又环保</h1>
        <p class="excerpt">把压在角落的卫衣拆开重新拼缝，是在“旧物新生”里学会的第一件事。谢谢项目组的耐心教学，让我意识到衣柜不是要更满，而是要被认真对待。</p>
        <div class="tags">
          <span class="tag">旧物新生</span>
          <span class="tag">环保</span>
        </div>
      </article>
    </a>
    <a href="https://example.com/article2" class="envelope" tabindex="0">
      <div class="env-body"></div>
      <div class="env-flap"></div>
      <article class="letter">
        <div class="meta">
          <div class="avatar">B</div>
          <div class="info">
            <div class="by">作者：橘子汽水</div>
            <div class="date">2025-12-06</div>
          </div>
        </div>
        <h1 class="title">第一次缝纫也能完成心意</h1>
        <p class="excerpt">活动里的“技能学习”环节救了我这个手残党。按照老师给的创意指南缝了个杯垫，送给舍友时她说比买的更有温度，真的很开心。</p>
        <div class="tags">
          <span class="tag">缝纫</span>
          <span class="tag">心意礼物</span>
        </div>
      </article>
    </a>
    <a href="https://example.com/article3" class="envelope" tabindex="0">
      <div class="env-body"></div>
      <div class="env-flap"></div>
      <article class="letter">
        <div class="meta">
          <div class="avatar">C</div>
          <div class="info">
            <div class="by">作者：雪糕筒</div>
            <div class="date">2025-12-03</div>
          </div>
        </div>
        <h1 class="title">扎染课堂点燃社团活力</h1>
        <p class="excerpt">我们社团接下“旧物新生”任务后，大家都跑来扎染旧T恤。看着蓝紫交织的颜色慢慢浮现，我才懂得动手创造的乐趣。</p>
        <div class="tags">
          <span class="tag">扎染</span>
          <span class="tag">社团</span>
        </div>
      </article>
    </a>
    <a href="https://example.com/article4" class="envelope" tabindex="0">
      <div class="env-body"></div>
      <div class="env-flap"></div>
      <article class="letter">
        <div class="meta">
          <div class="avatar">D</div>
          <div class="info">
            <div class="by">作者：夜行侠</div>
            <div class="date">2025-11-30</div>
          </div>
        </div>
        <h1 class="title">义卖现场的每一双眼睛</h1>
        <p class="excerpt">展览义卖那天，我负责给经过的同学讲解旧衣改造的故事。看他们摸到布料时露出的惊喜，我第一次觉得自己讲述的环保理念被好好听见了。</p>
        <div class="tags">
          <span class="tag">义卖</span>
          <span class="tag">传播</span>
        </div>
      </article>
    </a>
    <a href="https://example.com/article5" class="envelope" tabindex="0">
      <div class="env-body"></div>
      <div class="env-flap"></div>
      <article class="letter">
        <div class="meta">
          <div class="avatar">E</div>
          <div class="info">
            <div class="by">作者：星星糖</div>
            <div class="date">2025-11-26</div>
          </div>
        </div>
        <h1 class="title">宿舍里的可持续挑战</h1>
        <p class="excerpt">项目鼓励我们记录衣物改造日志，我干脆发动全宿舍一起参加。一边打磨针线活、一边聊消费观，原来环保也能这么好玩。</p>
        <div class="tags">
          <span class="tag">宿舍</span>
          <span class="tag">可持续</span>
        </div>
      </article>
    </a>
    <a href="https://example.com/article6" class="envelope" tabindex="0">
      <div class="env-body"></div>
      <div class="env-flap"></div>
      <article class="letter">
        <div class="meta">
          <div class="avatar">F</div>
          <div class="info">
            <div class="by">作者：风筝手</div>
            <div class="date">2025-11-22</div>
          </div>
        </div>
        <h1 class="title">技能与公益的双成长</h1>
        <p class="excerpt">主持工作坊时我负责教大家用旧牛仔布做手机包，没想到最后孩子们把作品捐去义卖。我在指导别人时，也重新审视了自己对“劳动教育”的理解。</p>
        <div class="tags">
          <span class="tag">工作坊</span>
          <span class="tag">公益</span>
        </div>
      </article>
    </a>
    <a href="https://example.com/article7" class="envelope" tabindex="0">
      <div class="env-body"></div>
      <div class="env-flap"></div>
      <article class="letter">
        <div class="meta">
          <div class="avatar">G</div>
          <div class="info">
            <div class="by">作者：音浪客</div>
            <div class="date">2025-11-18</div>
          </div>
        </div>
        <h1 class="title">记录下劳动的闪光瞬间</h1>
        <p class="excerpt">我负责把“旧物新生”全过程拍成短片，每次剪辑都被同伴的笑声打动。谢谢大家愿意在镜头前分享失败与灵感，让可持续理念真的被看见。</p>
        <div class="tags">
          <span class="tag">记录</span>
          <span class="tag">短片</span>
        </div>
      </article>
    </a>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const envelopes = document.querySelectorAll('.envelope');

    envelopes.forEach(function (envelope) {
      const letter = envelope.querySelector('.letter');
      if (!letter) {
        return;
      }

      const avatar = envelope.querySelector('.avatar');
      const author = envelope.querySelector('.by');
      if (avatar && author) {
        const rawText = author.textContent.trim();
        const match = rawText.match(/[:：]\s*(.+)$/);
        const name = (match ? match[1] : rawText).trim();
        const initial = name.charAt(0) || avatar.textContent.trim().charAt(0) || '?';
        avatar.textContent = initial;
        avatar.setAttribute('aria-label', name ? `作者 ${name}` : '作者');
      }

      const updateDimensions = function () {
        const letterStyles = window.getComputedStyle(letter);
        const topOffset = parseFloat(letterStyles.top) || 0;
        const bottomOffset = parseFloat(letterStyles.bottom) || 0;
        const contentHeight = letter.scrollHeight;
        const openHeight = contentHeight + topOffset + bottomOffset;

        envelope.style.setProperty('--env-open-height', `${Math.ceil(openHeight)}px`);
        letter.style.setProperty('--letter-open-height', `${Math.ceil(contentHeight)}px`);
      };

      envelope.setAttribute('role', 'button');
      const syncExpanded = function () {
        const isOpen = envelope.classList.contains('open');
        envelope.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
      };

      const setOpenState = function (forceOpen) {
        envelope.classList.toggle('open', forceOpen);
        syncExpanded();
      };

      const toggleOpen = function () {
        updateDimensions();
        const isOpen = envelope.classList.contains('open');
        setOpenState(!isOpen);
      };

      updateDimensions();
      window.addEventListener('resize', updateDimensions);
      setOpenState(true);

      envelope.addEventListener('click', function (event) {
        event.preventDefault();
        toggleOpen();
      });

      envelope.addEventListener('keydown', function (event) {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault();
          toggleOpen();
        }
      });
    });
  });
</script>
