import LiveScripts.Shared
import LiveScripts.S_047564febcb5c87047c8de607139e6ed372386913d87082e4774123e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_047564febcb5c87047c8de607139e6ed372386913d87082e4774123e.script [ctx] 10000]
