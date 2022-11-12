import Vue from 'vue'
import Vuex from 'vuex'
import Store from './store/Store'
import DiagramFrame from "@/components/DiagramFrame.vue";

import './assets/tailwind.css'
import './components/Cosmetic.scss'
import './components/Cosmetic-blue.scss'
import './components/Cosmetic-black-white.scss'
import './components/Cosmetic-star-uml.scss'
import './components/theme-blue-river.scss'
import './assets/themes/handwriting.css';


interface IZenUml {
  get code(): string | undefined;
  get theme(): string | undefined;
  // Resolve after rendering is finished.
  render: (code: string | undefined, theme: string | undefined) => Promise<IZenUml>
}

Vue.use(Vuex)

export default class ZenUml implements IZenUml{
  private readonly el: Element;
  private _code: string | undefined;
  private _theme: string | undefined;
  private readonly store: any;

  constructor(el: Element) {
    this.el = el;
    // create a new store
    this.store = Store();
    new Vue({el: this.el, store: new Vuex.Store(this.store), render: h => h(DiagramFrame) })
  }

  render(code: string | undefined, theme: string | undefined): Promise<IZenUml> {
    this._code = code || this._code;
    this._theme = theme || this._theme;
    // @ts-ignore
    this.store.state.code = this._code;
    // @ts-ignore
    this.store.state.theme = this._theme || 'default';

    return Promise.resolve(this);
  }

  get code(): string | undefined {
    return this._code;
  }

  get theme(): string | undefined{
    return this._theme;
  }
}