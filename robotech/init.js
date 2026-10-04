// Initialisation AOS (externalisee pour permettre une CSP sans script inline)
if (typeof AOS !== 'undefined') {
  const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  AOS.init({
    disable: reduce,
    duration: 1000,
    easing: 'ease-out-cubic',
    once: true,
    mirror: false,
    offset: 100,
    delay: 50,
    anchorPlacement: 'top-bottom'
  });
  window.addEventListener('load', () => AOS.refresh());
}
