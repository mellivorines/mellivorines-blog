import { AuroraDia, DiaConfig } from '@/utils/aurora-dia'
import { defineStore } from 'pinia'

export const useDiaStore = defineStore({
  id: 'diaStore',
  state: () => ({
    dia: new AuroraDia(),
    aurora_bot: {
      enable: true,
      locale: 'cn',
      bot_type: 'dia',
      tips: {}
    }
  }),
  getters: {},
  actions: {
    initializeBot(configs: DiaConfig): void {
      this.dia.installSoftware(configs)
      this.dia.on()
    }
  }
})
