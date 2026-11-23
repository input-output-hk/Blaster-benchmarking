import LiveScripts.Shared
import LiveScripts.S_102cda4952391ac02b95234a26fb9852655f07b8a9846447c438abbf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_102cda4952391ac02b95234a26fb9852655f07b8a9846447c438abbf.script [ctx] 10000]
