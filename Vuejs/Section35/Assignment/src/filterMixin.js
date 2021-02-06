export const filterMixin = {
  
  computed: {
    computedReverseText() {
      return this.textInput.split('').reverse().join('');
    },
    computedAppendLength() {
      return this.textInput ? this.textInput + ' (' + this.textInput.length + ')' : '';
    },
  },
}