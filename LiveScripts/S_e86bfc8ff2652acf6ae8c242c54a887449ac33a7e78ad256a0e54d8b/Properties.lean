import LiveScripts.Shared
import LiveScripts.S_e86bfc8ff2652acf6ae8c242c54a887449ac33a7e78ad256a0e54d8b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e86bfc8ff2652acf6ae8c242c54a887449ac33a7e78ad256a0e54d8b.script [datum, redeemer, ctx] 10000]
