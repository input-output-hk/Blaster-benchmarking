import LiveScripts.Shared
import LiveScripts.S_cdf3bbdf7be21e3fd9159291ebf52338ba17788dc34bd2273eb31e39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cdf3bbdf7be21e3fd9159291ebf52338ba17788dc34bd2273eb31e39.script [ctx] 10000]
