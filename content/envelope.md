# 信封文章组件

<style>
  :root{
    --env-width: 340px;
    --env-height: 200px;
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
    padding: 60px 24px;
  }

  .envelope-list {
    display: flex;
    flex-direction: column;
    gap: 100px;
    width: 100%;
    max-width: 800px;
    align-items: center;
  }

  /* 竖向排列的交错效果 */
  .envelope:nth-child(3n+1) {
    align-self: flex-start;
    margin-left: 10%;
  }
  
  .envelope:nth-child(3n+2) {
    align-self: center;
  }
  
  .envelope:nth-child(3n+3) {
    align-self: flex-end;
    margin-right: 10%;
  }

  @media (max-width: 768px) {
    .envelope-list {
      gap: 80px;
    }
    
    .envelope:nth-child(3n+1) {
      margin-left: 5%;
    }
    
    .envelope:nth-child(3n+3) {
      margin-right: 5%;
    }
  }

  @media (max-width: 480px) {
    .envelope-list {
      gap: 60px;
    }
    
    .envelope:nth-child(3n+1),
    .envelope:nth-child(3n+2),
    .envelope:nth-child(3n+3) {
      align-self: center;
      margin-left: 0;
      margin-right: 0;
    }
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
    transition: transform 0.3s ease;
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
    inset: 15% 6% 6% 6%;
    background: var(--paper-color);
    border-radius: 8px;
    box-shadow: 0 6px 16px rgba(0,0,0,0.12);
    padding: 18px 18px 16px;
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

  .envelope:hover .env-flap,
  .envelope:focus-within .env-flap{
    transform: rotateX(-180deg);
    box-shadow: 0 -20px 40px rgba(0,0,0,0.12);
  }

  @media (prefers-color-scheme: dark) {
    .envelope:hover .env-flap,
    .envelope:focus-within .env-flap{
      box-shadow: 0 -20px 40px rgba(0,0,0,0.5);
    }
  }

  .envelope:hover .letter,
  .envelope:focus-within .letter{
    opacity: 1;
    max-height: 1000px;
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
            <div class="by">作者：张三</div>
            <div class="date">2025-12-10</div>
          </div>
        </div>
        <h1 class="title">探索前端新技术</h1>
        <p class="excerpt">本文深入探讨了现代前端开发的最新技术趋势，包括性能优化、用户体验提升等多个方面的实践经验。</p>
        <div class="tags">
          <span class="tag">前端</span>
          <span class="tag">技术</span>
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
            <div class="by">作者：李四</div>
            <div class="date">2025-11-28</div>
          </div>
        </div>
        <h1 class="title">设计系统的构建之道</h1>
        <p class="excerpt">如何从零开始构建一个完整的设计系统？这篇文章分享了团队在实践中总结的经验，涵盖组件设计、文档规范、协作流程等核心要素。</p>
        <div class="tags">
          <span class="tag">设计</span>
          <span class="tag">系统</span>
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
            <div class="by">作者：王五</div>
            <div class="date">2025-12-05</div>
          </div>
        </div>
        <h1 class="title">CSS动画的艺术</h1>
        <p class="excerpt">动画让网页更加生动有趣。本文通过实例讲解如何创造流畅自然的CSS动画效果。</p>
        <div class="tags">
          <span class="tag">CSS</span>
          <span class="tag">动画</span>
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
            <div class="by">作者：赵六</div>
            <div class="date">2025-11-15</div>
          </div>
        </div>
        <h1 class="title">TypeScript最佳实践</h1>
        <p class="excerpt">TypeScript已成为大型项目的首选。文章总结了类型定义、泛型使用、编译配置等方面的最佳实践，帮助开发者写出更安全的代码。</p>
        <div class="tags">
          <span class="tag">TypeScript</span>
          <span class="tag">编程</span>
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
            <div class="by">作者：孙七</div>
            <div class="date">2025-12-01</div>
          </div>
        </div>
        <h1 class="title">响应式设计精要</h1>
        <p class="excerpt">在多设备时代，响应式设计至关重要。深入讲解媒体查询、弹性布局、视口单位的实战应用。</p>
        <div class="tags">
          <span class="tag">响应式</span>
          <span class="tag">布局</span>
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
            <div class="by">作者：周八</div>
            <div class="date">2025-11-20</div>
          </div>
        </div>
        <h1 class="title">性能优化实战指南</h1>
        <p class="excerpt">网站性能直接影响用户体验和转化率。本文分享代码分割、懒加载、缓存策略等实用技巧，帮助你的应用快如闪电。</p>
        <div class="tags">
          <span class="tag">性能</span>
          <span class="tag">优化</span>
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
            <div class="by">作者：吴九</div>
            <div class="date">2025-12-08</div>
          </div>
        </div>
        <h1 class="title">React Hooks深度解析</h1>
        <p class="excerpt">Hooks改变了React的开发方式。从useState到useEffect，从自定义Hook到性能优化，全面掌握Hooks的使用技巧。</p>
        <div class="tags">
          <span class="tag">React</span>
          <span class="tag">Hooks</span>
        </div>
      </article>
    </a>
  </div>
</div>