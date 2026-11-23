import LiveScripts.Shared
import LiveScripts.S_1273c8b408883a14ec73d0a58f5b0071ca88fffff42f473ffc315cb6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1273c8b408883a14ec73d0a58f5b0071ca88fffff42f473ffc315cb6.script [ctx] 10000]
