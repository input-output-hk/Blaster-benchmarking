import LiveScripts.Shared
import LiveScripts.S_ad353a777c817f4d9d6c4324930f5c6128400517ec9dae0461e034cd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ad353a777c817f4d9d6c4324930f5c6128400517ec9dae0461e034cd.script [ctx] 10000]
