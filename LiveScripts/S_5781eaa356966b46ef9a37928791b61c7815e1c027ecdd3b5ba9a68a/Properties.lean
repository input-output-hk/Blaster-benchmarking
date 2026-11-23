import LiveScripts.Shared
import LiveScripts.S_5781eaa356966b46ef9a37928791b61c7815e1c027ecdd3b5ba9a68a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5781eaa356966b46ef9a37928791b61c7815e1c027ecdd3b5ba9a68a.script [ctx] 10000]
