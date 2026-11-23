import LiveScripts.Shared
import LiveScripts.S_efd1df8dd5be97159425e198aba09ba5b8e94a14f81b84b6b722bba3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_efd1df8dd5be97159425e198aba09ba5b8e94a14f81b84b6b722bba3.script [ctx] 10000]
