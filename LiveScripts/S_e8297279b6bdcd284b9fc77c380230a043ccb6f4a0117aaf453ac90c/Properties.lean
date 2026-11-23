import LiveScripts.Shared
import LiveScripts.S_e8297279b6bdcd284b9fc77c380230a043ccb6f4a0117aaf453ac90c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e8297279b6bdcd284b9fc77c380230a043ccb6f4a0117aaf453ac90c.script [ctx] 10000]
