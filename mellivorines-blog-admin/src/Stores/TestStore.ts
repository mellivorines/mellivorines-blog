import { create } from 'zustand'
import {persist} from 'zustand/middleware'

const useBearStore = create(persist(
        (set) => ({
            bears: 100,
            increasePopulation: () => set((state: { bears: number }) => ({ bears: state.bears + 1 })),
            removeAllBears: () => set({ bears: 0 }),
        }),
        {
            name: 'bear-store',
            version: 1,
        }
)
)

export default useBearStore;