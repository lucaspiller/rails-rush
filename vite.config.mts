import { defineConfig } from "vite";
import * as path from "path";
import ViteRails from "vite-plugin-rails";

export default defineConfig({
  plugins: [
    ViteRails(),
  ],
  resolve: {
    alias: [
      {
        find: "@/lib",
        replacement: path.resolve(__dirname, "./app/javascript/components/lib/")
      },
      {
        find: "@/components",
        replacement: path.resolve(__dirname, "./app/javascript/components/")
      },
      {
        find: "@/entrypoints",
        replacement: path.resolve(__dirname, "./app/javascript/entrypoints")
      }
    ]
  },
})
