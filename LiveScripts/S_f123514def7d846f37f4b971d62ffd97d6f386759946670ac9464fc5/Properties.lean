import LiveScripts.Shared
import LiveScripts.S_f123514def7d846f37f4b971d62ffd97d6f386759946670ac9464fc5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f123514def7d846f37f4b971d62ffd97d6f386759946670ac9464fc5.script [datum, redeemer, ctx] 10000]
