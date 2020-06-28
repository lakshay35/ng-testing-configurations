/* tslint:disable */

declare global {
  interface Window {
    __env: any;
  }
}
export const environment = {
  production: true,
  env: window.__env.environmentName || 'ENV VARS MISSING',
};
