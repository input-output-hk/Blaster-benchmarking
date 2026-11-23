import LiveScripts.Shared
import LiveScripts.S_2d887830d30f31471d69363d0adcbd19d473bca846b20f0c94f26686.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d887830d30f31471d69363d0adcbd19d473bca846b20f0c94f26686.script [ctx] 10000]
