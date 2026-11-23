import LiveScripts.Shared
import LiveScripts.S_e6c90a5923713af5786963dee0fdffd830ca7e0c86a041d9e5833e91.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e6c90a5923713af5786963dee0fdffd830ca7e0c86a041d9e5833e91.script [datum, redeemer, ctx] 10000]
