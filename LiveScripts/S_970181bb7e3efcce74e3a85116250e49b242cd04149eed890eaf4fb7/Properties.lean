import LiveScripts.Shared
import LiveScripts.S_970181bb7e3efcce74e3a85116250e49b242cd04149eed890eaf4fb7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_970181bb7e3efcce74e3a85116250e49b242cd04149eed890eaf4fb7.script [ctx] 10000]
