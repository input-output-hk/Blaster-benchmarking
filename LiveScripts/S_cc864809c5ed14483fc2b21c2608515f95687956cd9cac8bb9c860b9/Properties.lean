import LiveScripts.Shared
import LiveScripts.S_cc864809c5ed14483fc2b21c2608515f95687956cd9cac8bb9c860b9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cc864809c5ed14483fc2b21c2608515f95687956cd9cac8bb9c860b9.script [ctx] 10000]
