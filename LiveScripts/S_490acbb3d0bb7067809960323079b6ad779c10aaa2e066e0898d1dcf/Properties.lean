import LiveScripts.Shared
import LiveScripts.S_490acbb3d0bb7067809960323079b6ad779c10aaa2e066e0898d1dcf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_490acbb3d0bb7067809960323079b6ad779c10aaa2e066e0898d1dcf.script [datum, redeemer, ctx] 10000]
